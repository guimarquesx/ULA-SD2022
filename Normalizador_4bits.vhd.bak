-- Autores: Abraão Carvalho Gomes      - DRE 121066101
--          Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Realizar a operação de normalização, ou seja, deslocar o vetor para a esquerda até que seu bit mais significativo seja 1.

-- Declaração de bibliotecas:	
	
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY Normalizador_4bits IS
	PORT (
		   a  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		   s  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		 );

END Normalizador_4bits;

ARCHITECTURE Norml OF Normalizador_4bits IS

-- Declaração de sinais

SIGNAL buffer1, buffer2  : STD_LOGIC;
SIGNAL Numintermed       : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

-- buffer1 e buffer2 são dois bits que recebem o número de deslocamentos à esquerda

-- Expressões do codificador de prioridade para o bit menos significativo

buffer2 <= NOT a(3) AND NOT a(2);
buffer1 <= (NOT a(3) AND NOT a(1)) OR (a(2) AND NOT a(3));

-- Deslocador

	PROCESS (buffer2, a) IS
	BEGIN
	CASE buffer2 IS
		WHEN '0' =>
			Numintermed <= a;
		WHEN '1' => 
			Numintermed <= a (1 DOWNTO 0) & "00";  
		WHEN OTHERS =>
			Numintermed <= a;
		END CASE;
	END PROCESS;

	PROCESS (buffer1, Numintermed) IS
	BEGIN
	CASE buffer1 IS 
		WHEN '0' =>
			s <= Numintermed;
		WHEN '1' =>
			s <= Numintermed (2 DOWNTO 0) & '0';  
		WHEN OTHERS =>
			s <= Numintermed;
		END CASE;
	END PROCESS;

END Norml;