-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

-- Este módulo tem como objetivo a selação das operações atráves de um MUX de 4 bits.

ENTITY Mux_Seletor IS
	PORT (
			Seletor 							: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			Soma, Res_Norml, Res_AND, Res_XOR  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Saida 						    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	
END Mux_Seletor;

ARCHITECTURE structural OF Mux_Seletor IS

SIGNAL Zero : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN

Zero <= "0000";

   Saida <= Soma 	    WHEN (Seletor = "000") ELSE -- Soma entre A e B
			Soma 	    WHEN (Seletor = "001") ELSE -- Subtração entre A e B
			Soma 	    WHEN (Seletor = "010") ELSE -- Incrementa de 1 (em A)
			Soma        WHEN (Seletor = "011") ELSE -- Troca sinal (em A)
			Soma 	    WHEN (Seletor = "100") ELSE -- Decrementa 1 (em A)
			Res_Norml 	WHEN (Seletor = "101") ELSE -- Normalizador (em A)
			Res_AND 	WHEN (Seletor = "110") ELSE -- Operação AND 
			Res_XOR 	WHEN (Seletor = "111") ELSE -- Operação XOR
			Zero;       

END structural;