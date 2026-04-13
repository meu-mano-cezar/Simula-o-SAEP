-- ============================================
-- SAEP — Sistema de Gerenciamento de Tarefas
-- Script de Criação do Banco de Dados
-- ============================================

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS saep
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE saep;

-- ============================================
-- TABELA: usuarios
-- ============================================
CREATE TABLE usuarios (
    id    INT          AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

-- ============================================
-- TABELA: tarefas
-- ============================================
CREATE TABLE tarefas (
    id            INT  AUTO_INCREMENT PRIMARY KEY,
    id_usuario    INT  NOT NULL,
    descricao     TEXT NOT NULL,
    setor         VARCHAR(100) NOT NULL,
    prioridade    ENUM('baixa', 'media', 'alta') NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    status        ENUM('a fazer', 'fazendo', 'pronto') NOT NULL DEFAULT 'a fazer',

    CONSTRAINT fk_tarefa_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- ============================================
-- DADOS DE EXEMPLO
-- ============================================

INSERT INTO usuarios (nome, email) VALUES
('Ana Silva',       'ana.silva@empresa.com'),
('Carlos Souza',    'carlos.souza@empresa.com'),
('Maria Oliveira',  'maria.oliveira@empresa.com');

INSERT INTO tarefas (id_usuario, descricao, setor, prioridade, data_cadastro, status) VALUES
(1, 'Revisar relatório mensal de produção',   'Produção',  'alta',  CURRENT_DATE, 'a fazer'),
(2, 'Atualizar cadastro de fornecedores',      'Compras',   'media', CURRENT_DATE, 'fazendo'),
(3, 'Treinamento de segurança alimentar',      'RH',        'baixa', CURRENT_DATE, 'pronto'),
(1, 'Verificar temperatura dos equipamentos', 'Produção',  'alta',  CURRENT_DATE, 'fazendo'),
(2, 'Organizar estoque de embalagens',         'Logística', 'media', CURRENT_DATE, 'a fazer');