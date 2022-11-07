-- Autores: Abraão Carvalho Gomes      - DRE 121066101
--          Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Selecionar as operações aritméticas e lógicas através de chaves externas.

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

ENTITY SELMux_4bits IS
	PORT (
			Sel 							: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			Soma,Res_Norml,Res_AND,Res_XOR  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Saida 						    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	
END SELMux_4bits;

ARCHITECTURE structural OF SELMux_4bits IS

SIGNAL zero : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN

zero <= "0000";

   Saida <= Soma 	    WHEN (sel = "000") ELSE -- Soma
			Soma 	    WHEN (sel = "001") ELSE -- Subtração
			Soma 	    WHEN (sel = "010") ELSE -- Incrementa 1 (em a)
			Soma        WHEN (sel = "011") ELSE -- Troca sinal (em a)
			Soma 	    WHEN (sel = "100") ELSE -- Decrementa 1 (em a)
			Res_Norml 	WHEN (sel = "101") ELSE -- Normalizador (em a)
			Res_AND 	WHEN (sel = "110") ELSE -- Operação AND 
			Res_XOR 	WHEN (sel = "111") ELSE -- Operação XOR
			zero;       

END structural;