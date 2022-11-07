-- Autores: Abraão Carvalho Gomes - DRE 121066101
-- 			Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Criar um somador completo de n bits a partir do componente full_adder.

-- Declaração de bibliotecas:
library ieee;
use ieee.std_logic_1164.all;

ENTITY somador_4bits IS
	GENERIC (N: INTEGER := 4);
	PORT (
	        a, b : IN STD_LOGIC_VECTOR(N-1 downto 0);
			cin  : IN STD_LOGIC;
			sum  : OUT STD_LOGIC_VECTOR(N-1 downto 0);
			cout,overflow : OUT STD_LOGIC);

END somador_4bits;

ARCHITECTURE structural of somador_4bits IS

-- Declarando o componente full_adder de 1 bit:

	COMPONENT full_adder IS
	PORT (
	        x, y, cin : IN STD_LOGIC;
			s, cout   : OUT STD_LOGIC);
			
	END COMPONENT;

	SIGNAL carry : STD_LOGIC_VECTOR(N DOWNTO 0);

BEGIN

	carry(0) <= cin;

-- Instanciando o componente full_adder:

	generate_adder : for i in a'RANGE GENERATE -- Para todos os índices de A:
	
    fa_i: full_adder PORT MAP(a(i), b(i), carry(i), sum(i), carry(i+1));
		
	END GENERATE;		

	cout <= carry(N);
	
	overflow <= carry(N) XOR carry(N-1);
	
END structural;