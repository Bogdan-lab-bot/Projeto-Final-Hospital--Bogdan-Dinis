-- ------------------------
-- HOSPITAIS
-- ------------------------
INSERT INTO Hospital (NomeHosp, Localidade) VALUES
('Hospital de Cascais', 'Cascais'),
('Hospital de Santa Maria', 'Lisboa'),
('Hospital de São João', 'Porto'),
('Hospital de Faro', 'Faro'),
('Hospital da Luz', 'Lisboa'),
('Hospital de Braga', 'Braga'),
('Hospital da Castanheira', 'Évora'),
('Hospital de Coimbra', 'Coimbra'),
('Hospital de Viana do Castelo', 'Viana do Castelo'),
('Hospital de Leiria', 'Leiria');

-- ------------------------
-- LABORATÓRIOS
-- ------------------------
INSERT INTO Laboratorio (Nome) VALUES
('Laboratório dos Malucos'),
('Laboratório dos Cientistas'),
('Laboratório Central de Lisboa'),
('Laboratório Químico Nacional'),
('Laboratório de Investigação Médica'),
('Laboratório BioTech do Porto'),
('Laboratório Genético de Coimbra'),
('Laboratório de Análises Clínicas de Faro'),
('Laboratório Experimental de Sintra'),
('Laboratório de Diagnóstico Avançado');

-- ------------------------
-- ANÁLISES
-- ------------------------
INSERT INTO Analise (Tipo, Data, Resultado, IdLab) VALUES
('Análise cerebral', '2025-07-21', 'OK', 1),
('TAC', '2025-11-01', 'NOT OK', 2),
('Raio-X', '2025-03-15', 'OK', 3),
('ECG', '2025-05-22', 'NOT OK', 4),
('Análise de sangue', '2025-08-10', 'OK', 5),
('Ressonância magnética', '2025-09-05', 'OK', 6),
('Ultrassom', '2025-04-18', 'NOT OK', 7),
('Eletroencefalograma', '2025-06-30', 'OK', 8),
('Teste de esforço', '2025-10-12', 'NOT OK', 9),
('Colonoscopia', '2025-01-25', 'OK', 10);

-- ------------------------
-- EMPREGADOS
-- ------------------------
INSERT INTO Empregado (IdHosp, Categoria, Vencimento, SocioSocial) VALUES
(1, 'Administrativo', 850.00, 'S'),
(2, 'Técnico', 1200.00, 'N'),
(3, 'Gestor', 2100.00, 'S'),
(4, 'Operário', 950.00, 'S'),
(5, 'Contabilista', 1800.00, 'N'),
(6, 'Recursos Humanos', 1600.00, 'N'),
(7, 'Informático', 2200.00, 'S'),
(8, 'Limpeza', 750.00, 'S'),
(9, 'Segurança', 1100.00, 'S'),
(10, 'Motorista', 1000.00, 'N');

-- ------------------------
-- ENFERMARIAS
-- ------------------------
INSERT INTO Enfermaria (Sigla, Camas, Funcao, IdHosp) VALUES
('UCO', 12, 'Cuidados Intensivos', 1),
('MED1', 20, 'Medicina Interna', 2),
('CIR2', 18, 'Cirurgia Geral', 3),
('PEDI', 15, 'Pediatria', 4),
('ORT1', 16, 'Ortopedia', 5),
('ONCO', 14, 'Oncologia', 6),
('CARD', 10, 'Cardiologia', 7),
('NEUR', 12, 'Neurologia', 8),
('GYN', 14, 'Ginecologia', 9),
('PSIQ', 8, 'Psiquiatria', 10);

-- ------------------------
-- ENFERMEIROS
-- ------------------------
INSERT INTO Enfermeiro (Nome, Idade, Morada, Telefone, IdEnfermaria, IdEmp) VALUES
('Ana Silva', 23, 'Rua das Acácias, 45, Lisboa', 912345678, 1, 1),
('Bruno Costa', 29, 'Av. da Boavista, 123, Porto', 923456789, 2, 2),
('Carla Mendes', 19, 'Rua do Sol, 78, Coimbra', 934567890, 3, 3),
('Diogo Ferreira', 27, 'Largo da Estação, 12, Braga', 945678901, 4, 4),
('Eva Rodrigues', 28, 'Travessa da Praia, 34, Faro', 956789012, 5, 5),
('Filipe Sousa', 41, 'Rua Central, 56, Setúbal', 967890123, 6, 6),
('Gabriela Lopes', 32, 'Alameda das Flores, 90, Viseu', 978901234, 7, 7),
('Hugo Santos', 31, 'Rua Nova, 11, Aveiro', 989012345, 8, 8),
('Maria da Luz', 32, 'Av. dos Moinhos, 200, Almada', 990123456, 9, 9),
('João Pereira', 57, 'Rua da Escola, 67, Évora', 901234567, 10, 10);

-- ------------------------
-- MÉDICOS
-- ------------------------
INSERT INTO Medico (Nome, Morada, Telefone, Especialidade, Miope, IdEmp, Idade, IdHosp) VALUES
('Dr. Ricardo Alves', 'Rua da Saúde, 10, Lisboa', 911111111, 'Cardiologia', 'S', 1, 45, 1),
('Dra. Carlona Guinsberg', 'Av. Central, 22, Porto', 922222222, 'Neurologia', 'N', 2, 50, 2),
('Dr. Tiago Ribeiro', 'Rua do Castelo, 5, Coimbra', 933333333, 'Ortopedia', 'N', 3, 39, 3),
('Dra. Luísa Costa', 'Largo da Praça, 8, Braga', 944444444, 'Pediatria', 'S', 4, 41, 4),
('Dr. Miguel Pinto', 'Travessa Azul, 15, Faro', 955555555, 'Oftalmologia', 'S', 5, 36, 5),
('Dra. Carolina Lima', 'Rua das Flores, 30, Aveiro', 966666666, 'Ginecologia', 'N', 6, 44, 6),
('Dr. Gabriel Canteeiro Candeeiro Pedreiro', 'Alameda dos Anjos, 45, Setúbal', 977777777, 'Oncologia', 'N', 7, 47, 7),
('Dra. Beatriz Sousa', 'Rua Nova, 60, Viseu', 988888888, 'Medicina Interna', 'N', 8, 33, 8),
('Dr. Gustavo Vieira', 'Av. das Palmeiras, 75, Évora', 999999999, 'Urologia', 'S', 9, 56, 9),
('Dra. Helena Mendes', 'Rua do Sol, 90, Leiria', 900000000, 'Dermatologia', 'S', 10, 40, 10);

-- ------------------------
-- DOENTES
-- ------------------------
INSERT INTO Doente (Nome, Idade, Morada, Telefone, Doenca, SocioSocial, IdAnalise, IdEmp, IdHosp) VALUES
('João Pão Azeitão', 17, 'Lisboa, Rua dos Condes Nº14', 973471941, 'COVID-19', 'S', 1, 1, 1),
('Maria De Canteiro', 24, 'Colaria, Rua dos Ventos', 980451789, 'Tuberculose', 'N', 2, 2, 2),
('Pedro Silva', 67, 'Torres Vedras, Estreito de Gibraltar', 982315718, 'Tosse', 'N', 3, 3, 3),
('Guilherme Alberto Riacho', 23, 'Porto, Vila Nova de Gaia', 973471942, 'Diabetes', 'N', 4, 4, 4),
('Rita Fernandes Retardo', 35, 'Sintra, Avenida da Liberdade Nº25', 969874512, 'Asma', 'N', 5, 5, 5),
('António Marques', 52, 'Coimbra, Rua da Universidade Nº3', 962341785, 'Hipertensão', 'S', 6, 6, 6),
('Luisa Madje', 28, 'Évora, Largo dos Mártires Nº10', 968742135, 'Gastrite', 'S', 7, 7, 7),
('Luís Ferreira', 44, 'Braga, Rua das Oliveiras Nº8', 981234567, 'Artrite', 'N', 8, 8, 8),
('Helena Castro', 61, 'Faro, Rua da Praia Nº22', 972341569, 'Colesterol Alto', 'S', 9, 9, 9),
('Rafael Pimentel', 19, 'Leiria, Bairro Novo Nº6', 984512378, 'Gripe', 'S', 10, 10, 10);

-- ------------------------
-- INSTITUIÇÕES
-- ------------------------
INSERT INTO Instituicao (Nome, Morada) VALUES
('Hospital da Luz', 'Av. da Liberdade, Lisboa'),
('Clínica Central', 'Rua do Centro, Porto'),
('Centro de Saúde do Alto', 'Largo do Alto, Coimbra'),
('Instituto Médico Lusitano', 'Rua das Flores, Braga'),
('Hospital de São João', 'Alameda Prof. Hernâni Monteiro, Porto'),
('Clínica Europa', 'Av. Europa, Lisboa'),
('Hospital CUF', 'Estrada da Luz, Lisboa'),
('Centro Hospitalar de Setúbal', 'Rua Camilo Castelo Branco, Setúbal'),
('Clínica do Parque', 'Rua do Parque, Faro'),
('Hospital Garcia de Orta', 'Av. Torrado da Silva, Almada');


-- ------------------------
-- CONSULTAS
-- ------------------------


--  Order by  --

SELECT Nome, Especialidade
FROM Medico
ORDER BY Especialidade ASC;

--  Inner join  --

SELECT D.Nome AS Doente, E.Categoria AS EmpregadoCategoria
FROM Doente D
INNER JOIN Empregado E ON D.SocioSocial = E.SocioSocial;

--  Like  --

SELECT Nome, Idade, Doenca
FROM Doente
WHERE Nome LIKE 'L%';

--  Group by  --

SELECT Especialidade, COUNT(*) AS TotalMedicos
FROM Medico
GROUP BY Especialidade;

--  Função agregadora  --

SELECT AVG(Vencimento) AS MediaSalarial
FROM Empregado;

--  Subconsulta  --

SELECT Nome, Doenca
FROM Doente
WHERE Doenca = (
    SELECT Doenca
    FROM Doente
    WHERE Nome = 'João Pão Azeitão'
);

--  Consulta complexa  --

SELECT M.Nome AS Medico,
       M.Especialidade,
       COUNT(D.IdDoente) AS DoentesMais50
FROM Medico M
INNER JOIN Doente D ON D.Morada LIKE CONCAT('%', M.Morada, '%')
WHERE D.Idade > 50
GROUP BY M.Nome, M.Especialidade
ORDER BY DoentesMais50 DESC;
