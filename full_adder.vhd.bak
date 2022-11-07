-- Autores: Abraão Carvalho Gomes      - DRE 121066101
--          Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Criar um somador completo de 1 bit.

-- Declaração de bibliotecas:	
library ieee;
use ieee.std_logic_1164.all;

ENTITY full_adder IS
	PORT (
	        x, y, cin : IN STD_LOGIC;
			s, cout   : OUT STD_LOGIC);
			
END full_adder;

ARCHITECTURE FA OF full_adder IS

BEGIN

-- Expressões obtidas a partir da tabela-verdade do full adder

	s <= (x XOR y) XOR cin;
	
	cout <= (x AND y) OR (x AND cin) OR (y AND cin);

END FA;
	