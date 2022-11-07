-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:	
library ieee;
use ieee.std_logic_1164.all;

ENTITY full_adder IS
	PORT (
	        X, Y, Cin : IN STD_LOGIC;
			S, Cout   : OUT STD_LOGIC);
			
END full_adder;

ARCHITECTURE FA OF full_adder IS

BEGIN

-- Lógica do full adder a partir da sua tabela verdade

	S <= (X XOR Y) XOR Cin;
	
	Cout <= (X AND Y) OR (X AND Cin) OR (Y AND Cin);

END FA;
	