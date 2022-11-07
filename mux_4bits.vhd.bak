-- Autores: Abraão Carvalho Gomes - DRE 121066101
-- 			Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivo: Criar um MUX que recebe o operando B e, dependendo da seleção,
--           entrega o operando B normalmente, barrado ou zerado ("0000").

-- Declaração de bibliotecas:

library ieee;
use ieee.std_logic_1164.all;

ENTITY mux_4bits IS

	PORT (
			b, bl , mux1_zero , mux1_1comp1	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			sel        	                    : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			saida      	                    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

END mux_4bits;
			
ARCHITECTURE dataflow OF mux_4bits IS

BEGIN

-- Se sel for "000",  seleciona b normalmente;
-- Se sel for "001",  seleciona b barrado;
-- Se não for nenhum, seleciona "0000".

saida <=    b           WHEN (sel = "000") ELSE
			bl          WHEN (sel = "001") ELSE
			mux1_1comp1 WHEN (sel = "100") ELSE 
			mux1_zero ;
			
END dataflow;