-- Aluno: Guilherme Marques Ribeiro
-- DRE: 116060661

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

-- Este módulo tem como objetivo fazer um somador de 4 bits a partir do componente full adder de 1 bit criado

ENTITY somador IS
	GENERIC (N: INTEGER := 4);
	PORT (
	        A, B : IN STD_LOGIC_VECTOR(N-1 downto 0);
			Cin  : IN STD_LOGIC;
			Sum  : OUT STD_LOGIC_VECTOR(N-1 downto 0);
			Cout, Overflow : OUT STD_LOGIC);

END somador;

ARCHITECTURE structural of somador IS

-- Declarando do componente full_adder de 1 bit:

	COMPONENT full_adder IS
	PORT (
	        X, Y, Cin : IN STD_LOGIC;
			S, Cout   : OUT STD_LOGIC);
			
	END COMPONENT;

	SIGNAL Carry : STD_LOGIC_VECTOR(N DOWNTO 0);

BEGIN

	Carry(0) <= Cin;

-- Mapeando o componente full_adder:

	generate_adder : for i in A'RANGE GENERATE -- Para todos os índices de A:
	
    fa_i: full_adder PORT MAP(A(i), B(i), Carry(i), Sum(i), Carry(i+1));
		
	END GENERATE;		

	Cout <= Carry(N);
	
	Overflow <= Carry(N) XOR Carry(N-1);
	
END structural;