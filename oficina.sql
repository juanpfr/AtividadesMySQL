CREATE DATABASE oficina;

USE oficina;

CREATE TABLE marca(
id_marca INT AUTO_INCREMENT PRIMARY KEY,
marca VARCHAR(20) NOT NULL
);

CREATE TABLE cor(
id_cor INT AUTO_INCREMENT PRIMARY KEY,
cor VARCHAR(15) NOT NULL
);

CREATE TABLE carros(
id_carros INT AUTO_INCREMENT PRIMARY KEY,
placa VARCHAR(8) NOT NULL,
modelo VARCHAR(20) NOT NULL,
id_marca INT UNIQUE
);


ALTER TABLE carros
ADD FOREIGN KEY (id_marca)
REFERENCES marca (id_marca);

CREATE TABLE carro_cor(
id_carro INT,
id_cor INT
);

ALTER TABLE carro_cor
ADD CONSTRAINT fk_carro_cor
FOREIGN KEY (id_carro)
REFERENCES carros (id_carro);

CREATE TABLE clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
sexo ENUM('M', 'F') NOT NULL,
nome VARCHAR(50) NOT NULL,
id_carro INT UNIQUE
);

ALTER TABLE clientes
ADD FOREIGN KEY (carro)
REFERENCES carros (id_carro);

CREATE TABLE telefones(
id_telefone INT AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR(20),
tipo VARCHAR(10),
id_cliente INT
);

ALTER TABLE telefones
ADD CONSTRAINT fk_telefone_cliente
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente);

DROP DATABASE oficina;

# Exemplo do professor

create database oficina;
use oficina;
create table cliente (
idcliente int primary key auto_increment,
nome varchar(30)not null,
sexo enum ('M','F') not null,
id_carro int unique );

create table telefone (
idtelefone int primary key auto_increment,
tipo enum('cel','res','com') not null,
numero varchar (30),
id_cliente int);

create table marca (
idmarca int primary key auto_increment,
marca varchar(30)unique
);

create table carro (
idcarro int primary key auto_increment,
modelo varchar (30) not null,
placa varchar (30) not null unique,
id_marca int);

create table cor (
idcor int primary key auto_increment,
cor varchar(30) unique
);

create table carro_cor (
id_carro int,
id_cor int,
primary key (id_carro, id_cor)
);

alter table telefone
add constraint fk_telefone_cliente
foreign key (id_cliente)
references cliente (idcliente);

alter table cliente
add constraint fk_cliente_carro
foreign key (id_carro)
references carro (idcarro);