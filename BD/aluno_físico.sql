/* aluno.logico: */

CREATE TABLE Alunos (
    nome VARCHAR (50),
    cpf VARCHAR (50),
    _id_alu INTEGER PRIMARY KEY,
    historico INTEGER
);

CREATE TABLE Curso_Matriz (
    _id_cur INTEGER,
    materias VARCHAR (50),
    _id_mat INTEGER,
    carga_horaria TIME,
    fk_Turma__id_turma INTEGER,
    PRIMARY KEY (_id_cur, _id_mat)
);

CREATE TABLE Professor (
    nome VARCHAR (50),
    cpf VARCHAR (50),
    carga_horaria TIME,
    _id_pro INTEGER PRIMARY KEY
);

CREATE TABLE Disciplinas (
    Hora TIME,
    Materia VARCHAR (50),
    _id_dis INTEGER PRIMARY KEY,
    Plano_de_estudo VARCHAR (50)
);

CREATE TABLE __contem (
    _id_mat INTEGER,
    _id_dis INTEGER,
    modulo_serie INTEGER,
    fk_Curso_Matriz__id_cur INTEGER,
    fk_Curso_Matriz__id_mat INTEGER,
    fk_Disciplinas__id_dis INTEGER
);

CREATE TABLE __faz (
    fk_Curso_Matriz__id_cur INTEGER,
    fk_Curso_Matriz__id_mat INTEGER,
    fk_Alunos__id_alu INTEGER
);

CREATE TABLE __administra (
    _id_pro INTEGER,
    fk_Disciplinas__id_dis INTEGER,
    fk_Professor__id_pro INTEGER
);

CREATE TABLE Turma (
    _id_turma INTEGER PRIMARY KEY
);

CREATE TABLE __tem (
    _id_alu INTEGER,
    fk_Turma__id_turma INTEGER,
    fk_Alunos__id_alu INTEGER
);

ALTER TABLE Curso_Matriz ADD CONSTRAINT FK_Curso_Matriz_2
    FOREIGN KEY (fk_Turma__id_turma)
    REFERENCES Turma (_id_turma)

ALTER TABLE __contem ADD CONSTRAINT FK___contem_1
    FOREIGN KEY (fk_Curso_Matriz__id_cur, fk_Curso_Matriz__id_mat)
    REFERENCES Curso_Matriz (_id_cur, _id_mat);
 
ALTER TABLE __contem ADD CONSTRAINT FK___contem_2
    FOREIGN KEY (fk_Disciplinas__id_dis)
    REFERENCES Disciplinas (_id_dis);
 
ALTER TABLE __faz ADD CONSTRAINT FK___faz_1
    FOREIGN KEY (fk_Curso_Matriz__id_cur, fk_Curso_Matriz__id_mat)
    REFERENCES Curso_Matriz (_id_cur, _id_mat);
 
ALTER TABLE __faz ADD CONSTRAINT FK___faz_2
    FOREIGN KEY (fk_Alunos__id_alu)
    REFERENCES Alunos (_id_alu);
 
ALTER TABLE __administra ADD CONSTRAINT FK___administra_1
    FOREIGN KEY (fk_Disciplinas__id_dis)
    REFERENCES Disciplinas (_id_dis);
 
ALTER TABLE __administra ADD CONSTRAINT FK___administra_2
    FOREIGN KEY (fk_Professor__id_pro)
    REFERENCES Professor (_id_pro);
 
ALTER TABLE __tem ADD CONSTRAINT FK___tem_1
    FOREIGN KEY (fk_Turma__id_turma)
    REFERENCES Turma (_id_turma);
 
ALTER TABLE __tem ADD CONSTRAINT FK___tem_2
    FOREIGN KEY (fk_Alunos__id_alu)
    REFERENCES Alunos (_id_alu);