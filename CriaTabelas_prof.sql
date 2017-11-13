CREATE DATABASE IF NOT EXISTS ANDRE;
use ANDRE;

-- Criacao das tabelas:
CREATE TABLE if not exists CURSO(
       NumCurso INTEGER NOT NULL,
       Nome CHAR(30) NOT NULL,
       TotalCreditos INTEGER NOT NULL,
       CONSTRAINT CHAVECURSO 
         PRIMARY KEY (NumCurso)
)ENGINE=INNODB;

CREATE TABLE if not exists ALUNO(
       NumAluno INTEGER NOT NULL,
       Nome CHAR(70) NOT NULL,
       Endereco CHAR(70) NOT NULL,
       Cidade CHAR(25) NOT NULL,
       Telefone CHAR(25),
       NumCurso INTEGER NOT NULL,
       CONSTRAINT CHAVEALUNO
         PRIMARY KEY (NumAluno),
       CONSTRAINT ESTRANGEIRACURSO
         FOREIGN KEY (NumCurso) REFERENCES CURSO (NumCurso)
) ENGINE=INNODB;

CREATE TABLE if not exists DISCIPLINA(
       NumDisp INTEGER NOT NULL,
       Nome CHAR(30) NOT NULL,
       QuantCreditos INTEGER NOT NULL,
       CONSTRAINT CHAVEDISCIPLINA
         PRIMARY KEY (NumDisp)
)ENGINE=INNODB;

CREATE TABLE if not exists PROFESSOR(
       NumFunc INTEGER NOT NULL,
       Nome CHAR(70) NOT NULL,
       Admissao DATE NOT NULL,
       AreaPesquisa CHAR(30),
       CONSTRAINT CHAVEPROFESSOR
         PRIMARY KEY (NumFunc)
)ENGINE=INNODB;

CREATE TABLE if not exists AULA(
       NumAluno INTEGER NOT NULL,
       NumDisp INTEGER NOT NULL,
       NumFunc INTEGER NOT NULL,
       Semestre CHAR(10) NOT NULL,
       Nota DECIMAL(5,2) NOT NULL,
       CONSTRAINT CHAVEAULA
         PRIMARY KEY (NumAluno, NumDisp, NumFunc, Semestre),
       CONSTRAINT ESTRANGEIRAALUNO
         FOREIGN KEY (NumAluno) REFERENCES ALUNO(NumAluno),
       CONSTRAINT ESTRANGEIRADISCIPLINA
         FOREIGN KEY (NumDisp) REFERENCES DISCIPLINA(NumDisp),
       CONSTRAINT ESTRANGEIRAPROFESSOR
         FOREIGN KEY (NumFunc) REFERENCES PROFESSOR (NumFunc)
)ENGINE=INNODB;

CREATE TABLE if not exists DISCIPLINACURSO(
       NumDisp INTEGER NOT NULL,
       NumCurso INTEGER NOT NULL,
       CONSTRAINT CHAVEDISPCURSO
         PRIMARY KEY (NumDisp, NumCurso),
       CONSTRAINT ESTRANGEIRADISP
         FOREIGN KEY (NumDisp) REFERENCES DISCIPLINA (NumDisp),
       CONSTRAINT ESTRANGEIRACURSO_B
         FOREIGN KEY (NumCurso) REFERENCES CURSO (NumCurso)
)ENGINE=INNODB;