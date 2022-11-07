-- Autores: Abraão Carvalho Gomes - DRE 121066101
-- 			Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Criar um componente que troca o sinal do operando A.

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

ENTITY troca_sinal IS
	PORT (
	        a,al    : IN STD_LOGIC_VECTOR(3 downto 0);
			k   	: IN STD_LOGIC;
			a2      : OUT STD_LOGIC_VECTOR(3 downto 0));
			
END troca_sinal;

ARCHITECTURE TS OF troca_sinal IS

BEGIN

a2 <= al when (k = '1') else
	  a;

END TS;

