-- Remover roles antigas, se existirem (compatível com MySQL/MariaDB)
DROP ROLE IF EXISTS empregado, medico, enfermeiro, doente, laboratorio, admin;

-- Criar roles base
CREATE ROLE empregado;
CREATE ROLE medico;
CREATE ROLE enfermeiro;
CREATE ROLE doente;
CREATE ROLE laboratorio;

-- Criar views para proteger dados sensíveis
CREATE OR REPLACE VIEW `grupohospital`.`EmpregadoPublico` AS
SELECT IdEmp, IdHosp, Categoria, IdInst 
FROM `grupohospital`.`Empregado`;

CREATE OR REPLACE VIEW `grupohospital`.`DoentePublico` AS
SELECT IdDoente, Nome, Idade, IdInst
FROM `grupohospital`.`Doente`;

CREATE OR REPLACE VIEW `grupohospital`.`DoenteMedico` AS
SELECT IdDoente, Nome, Morada, Telefone, Doenca, IdAnalise, Idade, SocioSocial, IdInst
FROM `grupohospital`.`Doente`;

-- Privilégios para a role 'empregado' (acesso administrativo/recursos humanos limitado)
GRANT SELECT ON `grupohospital`.`EmpregadoPublico` TO empregado;
GRANT SELECT ON `grupohospital`.`Hospital` TO empregado;
GRANT SELECT ON `grupohospital`.`Instituicao` TO empregado;
REVOKE SELECT ON `grupohospital`.`Empregado` FROM empregado;

-- Privilégios para a role 'medico'
-- médicos podem ver e atualizar informação clínica dos doentes e registar/consultar análises
GRANT SELECT, UPDATE ON `grupohospital`.`DoenteMedico` TO medico;
GRANT SELECT, INSERT, UPDATE ON `grupohospital`.`Analise` TO medico;
GRANT SELECT ON `grupohospital`.`Laboratorio` TO medico;
REVOKE SELECT, UPDATE ON `grupohospital`.`Doente` FROM medico;

-- Privilégios para a role 'enfermeiro'
-- enfermeiros podem consultar e atualizar alguns dados dos doentes e gerir enfermarias
GRANT SELECT ON `grupohospital`.`DoenteMedico` TO enfermeiro;
GRANT SELECT, UPDATE ON `grupohospital`.`Enfermaria` TO enfermeiro;
GRANT SELECT, INSERT ON `grupohospital`.`Enfermeiro` TO enfermeiro;
REVOKE SELECT, UPDATE ON `grupohospital`.`Doente` FROM enfermeiro;

-- Privilégios para a role 'doente'
-- doentes podem ver apenas informações públicas
GRANT SELECT ON `grupohospital`.`DoentePublico` TO doente;
REVOKE SELECT ON `grupohospital`.`Doente` FROM doente;

-- Privilégios para a role 'laboratorio'
-- laboratórios podem inserir/atualizar resultados de análises e ver meta-info de laboratórios
GRANT SELECT, INSERT, UPDATE ON `grupohospital`.`Analise` TO laboratorio;
GRANT SELECT ON `grupohospital`.`Laboratorio` TO laboratorio;

-- Remover acessos diretos às tabelas principais
REVOKE ALL PRIVILEGES ON `grupohospital`.`Empregado` FROM PUBLIC;
REVOKE ALL PRIVILEGES ON `grupohospital`.`Doente` FROM PUBLIC;

-- Aplicar mudanças de privilégios
FLUSH PRIVILEGES;
