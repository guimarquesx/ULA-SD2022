-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

-- Este é o módulo da operação XOR da ULA

ENTITY xor_op IS
	PORT (
			A, B 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
			
END xor_op;

ARCHITECTURE structural OF xor_op IS

BEGIN

S <= A XOR B;

END structural;