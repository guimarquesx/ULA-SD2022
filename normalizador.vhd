-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:	
	
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Este é o módulo de normalização da ULA que será responsável por deslocar o vetor 
-- para a esquerda até que seu bit mais significativo seja 1.

ENTITY normalizador IS
	PORT (
		   A  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		   S  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		 );

END normalizador;

ARCHITECTURE Norml OF normalizador IS

-- Declaração de sinais

SIGNAL buffer1, buffer2  : STD_LOGIC;
SIGNAL NumInter      : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

-- buffer1 e buffer2 são dois bits que recebem o número de deslocamentos à esquerda

-- Expressões do codificador de prioridade para o bit menos significativo

buffer2 <= NOT A(3) AND NOT A(2);
buffer1 <= (NOT A(3) AND NOT A(1)) OR (A(2) AND NOT A(3));

-- Deslocador

	PROCESS (buffer2, A) IS
	BEGIN
	CASE buffer2 IS
		WHEN '0' =>
			NumInter <= A;
		WHEN '1' => 
			NumInter <= A (1 DOWNTO 0) & "00";  
		WHEN OTHERS =>
			NumInter <= A;
		END CASE;
	END PROCESS;

	PROCESS (buffer1, NumInter) IS
	BEGIN
	CASE buffer1 IS 
		WHEN '0' =>
			S <= NumInter;
		WHEN '1' =>
			S <= NumInter (2 DOWNTO 0) & '0';  
		WHEN OTHERS =>
			S <= NumInter;
		END CASE;
	END PROCESS;

END Norml;