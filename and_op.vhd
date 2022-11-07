-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

-- Este é o módulo da operação AND da ULA

ENTITY and_op IS
	PORT (
			A, B 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
			
END and_op;

ARCHITECTURE structural OF and_op IS

BEGIN

S <= A AND B;

END structural;