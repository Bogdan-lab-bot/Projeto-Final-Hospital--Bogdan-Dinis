-- Remover roles antigas, se existirem (compatível com MySQL/MariaDB)
DROP ROLE IF EXISTS empregado, medico, enfermeiro, doente, laboratorio, admin;

-- Criar roles base
CREATE ROLE empregado;
CREATE ROLE medico;
CREATE ROLE enfermeiro;
CREATE ROLE doente;
CREATE ROLE laboratorio;

-- Privilégios para a role 'empregado' (acesso administrativo/recursos humanos limitado)
GRANT SELECT ON `grupohospital`.`Empregado` TO empregado;
GRANT SELECT ON `grupohospital`.`Hospital` TO empregado;
GRANT SELECT ON `grupohospital`.`Instituicao` TO empregado;

-- Privilégios para a role 'medico'
-- médicos podem ver e atualizar informação clínica dos doentes e registar/consultar análises
GRANT SELECT, UPDATE ON `grupohospital`.`Doente` TO medico;
GRANT SELECT, INSERT, UPDATE ON `grupohospital`.`Analise` TO medico;
GRANT SELECT ON `grupohospital`.`Laboratorio` TO medico;

-- Privilégios para a role 'enfermeiro'
-- enfermeiros podem consultar e atualizar alguns dados dos doentes e gerir enfermarias
GRANT SELECT, UPDATE ON `grupohospital`.`Doente` TO enfermeiro;
GRANT SELECT, UPDATE ON `grupohospital`.`Enfermaria` TO enfermeiro;
GRANT SELECT, INSERT ON `grupohospital`.`Enfermeiro` TO enfermeiro;

-- Privilégios para a role 'doente'
-- doentes podem (globalmente) ler a tabela Doente; para controlo de privacidade adicional,
-- deve aplicar-se filtragem por identidade a nível da aplicação.
GRANT SELECT ON `grupohospital`.`Doente` TO doente;

-- Privilégios para a role 'laboratorio'
-- laboratórios podem inserir/atualizar resultados de análises e ver meta-info de laboratórios
GRANT SELECT, INSERT, UPDATE ON `grupohospital`.`Analise` TO laboratorio;
GRANT SELECT ON `grupohospital`.`Laboratorio` TO laboratorio;

-- Aplicar mudanças de privilégios
FLUSH PRIVILEGES;
