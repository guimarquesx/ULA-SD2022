-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

-- O objetivo deste módulo é fazer a troca de sinal do operando A.

ENTITY troca_sinal IS
	PORT (
	      A     : IN STD_LOGIC_VECTOR(3 downto 0);
			Al    : IN STD_LOGIC_VECTOR(3 downto 0);
			K  	: IN STD_LOGIC;
			A2    : OUT STD_LOGIC_VECTOR(3 downto 0));
			
END troca_sinal;

ARCHITECTURE TS OF troca_sinal IS

BEGIN

A2 <= Al when (K = '1') else
	  A;

END TS;

