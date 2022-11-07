-- Autores: Abraão Carvalho Gomes - DRE 121066101
-- 			Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Criar uma ULA que contém 8 operações, podendo selecionar as operações
--           através de um seletor. Na saída, tem-se o resultado da operação selecionada
--           e as quatro flags: carry out, overflow, zero e sinal.

-- Declaração de bibliotecas:
library ieee;
use ieee.STD_LOGIC_1164.all;

ENTITY ula_4bits IS
	GENERIC (N: INTEGER := 4);
	PORT(
	       a,b  		                            : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		   seletor 	                                : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		   flagCout,flagovflw, flagzero, flagsinal  : OUT STD_LOGIC;
		   SAIDA                                    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
			
END ula_4bits;

ARCHITECTURE structural OF ula_4bits IS

SIGNAL bcomp1,acomp1, b2, Soma, Res_Norml , Result , mux1_zero, mux1_1comp1 , a2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin, verifica	: STD_LOGIC;

-- Declarando o componente somador_4bits:
	COMPONENT somador_4bits IS
		PORT(
		      a, b          : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			  cin           : IN STD_LOGIC;
			  sum           : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			  cout,overflow : OUT STD_LOGIC
			);
				
	END COMPONENT;
	
	SIGNAL cout, overflow : STD_LOGIC;
	SIGNAL Decr1          : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
-- Declarando o componente troca_sinal:
	COMPONENT troca_sinal IS
		PORT( 
		        a,al : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			    k    : IN STD_LOGIC;
			    a2   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	
	END COMPONENT;
	
-- Declarando o componente mux_4bits (Seletor de b para a+b ou a-b)
	COMPONENT mux_4bits IS
		PORT(
			    b, bl , mux1_zero , mux1_1comp1  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			    sel                              : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			    saida      	                     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
				
	END COMPONENT;
	
-- Declarando o componente SELMux_4bits (Seletor de operações)
	COMPONENT SELMux_4bits IS
		PORT(
			Sel 							: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			Soma,Res_Norml,Res_AND,Res_XOR  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Saida 						    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;

-- Declarando o componente Normalizador_4bits (em a)
	COMPONENT Normalizador_4bits IS 
	    PORT(
		        a  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		        s  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		    );
	
	END COMPONENT;
	
-- Declarando o componente op_and (operação AND)	
	COMPONENT op_and IS
		PORT(
			  a, b 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			  s		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL Res_AND : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
-- Declarando o componente op_xor (operação XOR)	
	COMPONENT op_xor IS
		PORT(
		      a, b 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			  s		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL Res_XOR : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

-- Atribuindo valores iniciais aos sinais:

mux1_zero <= "0000" ;
mux1_1comp1 <= "1110" ;

SAIDA <= Result;

Cin <= seletor(0) OR seletor(1) OR seletor(2) ;
verifica <= (not seletor(2))  AND (seletor(1)) AND (seletor(0));

acomp1 <= NOT a;
bcomp1 <= NOT b;

-- Instanciando componentes:

-- "Soma" é a saida do somador, porém é usado para as operações de Soma, Subtração, Incremento de 1 e Decremento de 1
f_Somad : somador_4bits PORT MAP(a2, b2, Cin, Soma, flagCout, flagovflw);

-- Operação troca sinal (de a)
f_trocS : troca_sinal PORT MAP(a, acomp1, verifica, a2);

-- Operação que normaliza os bits do operando a
f_Normaliz : Normalizador_4bits PORT MAP(a, Res_Norml);

-- Operação lógica AND
f_opAnd : op_and PORT MAP(a, b, Res_AND);

-- Operação lógica XOR
f_opXor : op_xor PORT MAP(a, b, Res_XOR);

-- MUX que, depndendo da seleção, entrega o operando B normalmente, barrado ou zerado ("0000")
f_mux1 : mux_4bits PORT MAP(b, bcomp1, mux1_zero, mux1_1comp1, seletor, b2);

-- MUX para seleção das 8 operações
f_SelMux : SELMux_4bits PORT MAP(seletor, Soma, Res_Norml, Res_AND, Res_XOR, Result); 

-- Flag zero utilizando portas OR e NOR
flagzero <= (Result(3) OR Result(2)) NOR (Result(1) OR Result(0));

-- A flag sinal acenderá quando o bit mais significativo do resultado for '1'
flagsinal <= Result(3);

END structural;