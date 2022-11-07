-- Autores: Abraão Carvalho Gomes      - DRE 121066101
--          Gabriel Rodrigues da Silva - DRE 121044858

-- Objetivos: Criar um contador que percorre todos os binários representados por 4 bits,
--            mostrar o resultado das operações aritméticas nos displays de 7 segmentos,
--            mostrar o resultado das operações lógicas nos LEDs vermelhos e
--            mostrar as flags nos LEDs verdes.

-- Declaração de bibliotecas:

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY contador_4bits IS
  PORT (
        G_CLOCK_50 : IN  STD_LOGIC;                     -- Clock de 50 MHz
        V_BT       : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);  -- Botão da placa FPGA
        V_SW       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);  -- Switches da placa FPGA
        G_LEDG     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  -- LEDs verdes
        G_LEDR     : OUT STD_LOGIC_VECTOR(17 DOWNTO 0); -- LEDs vermelhos
    
        G_HEX7, G_HEX6, G_HEX5, G_HEX4, G_HEX1, G_HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) -- Displays de 7 segmentos
       ); 
    
END contador_4bits;

ARCHITECTURE TOP OF contador_4bits IS

-- Declaração de componentes

COMPONENT ula_4bits is
	PORT(
	       a,b  		                            : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		   seletor 	                                : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		   flagCout,flagovflw, flagzero, flagsinal  : OUT STD_LOGIC;
		   SAIDA                                    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
			
END COMPONENT;

-- Declaração de sinais da ULA

SIGNAL seletor                                 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL flagCout,flagovflw, flagzero, flagsinal : STD_LOGIC;
SIGNAL SAIDA                                   : STD_LOGIC_VECTOR(3 DOWNTO 0);

-- Declaração de sinais do contador

SIGNAL COUNT_a, COUNT_b                : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL FREQ_DIVIDER_a, FREQ_DIVIDER_b  : INTEGER RANGE 1 TO 50000000;
  
-- Declaração de sinais dos displays de 7 segmentos
  
-- Displays do operando A 
SIGNAL OUTPUT_7SEGMENT_7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL OUTPUT_7SEGMENT_6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  
-- Displays do operando B
SIGNAL OUTPUT_7SEGMENT_5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL OUTPUT_7SEGMENT_4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
  
-- Displays do resultado da operação
SIGNAL OUTPUT_7SEGMENT_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL OUTPUT_7SEGMENT_0 : STD_LOGIC_VECTOR(6 DOWNTO 0);    
 
-- Resultado das operações lógicas usando os LEDs vermelhos
SIGNAL OUTPUT_RLEDS : STD_LOGIC_VECTOR(17 DOWNTO 0);
  
-- Mostrando flags usando os LEDs verdes
SIGNAL OUTPUT_GLEDS : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  BEGIN

    -- Instanciando componentes:

    usando_ULA : ula_4bits PORT MAP(COUNT_a, COUNT_b, seletor, flagCout, flagovflw, flagzero, flagsinal, SAIDA);

    -- Atribuindo os sinais a seus respectivos displays de 7 segmentos
    
    -- Displays do operando a:
    G_HEX7 <= OUTPUT_7SEGMENT_7;
    G_HEX6 <= OUTPUT_7SEGMENT_6;
    
    -- Displays do operando b:
    G_HEX5 <= OUTPUT_7SEGMENT_5;
    G_HEX4 <= OUTPUT_7SEGMENT_4;
    
    -- Displays do resultado:
    G_HEX1 <= OUTPUT_7SEGMENT_1;
    G_HEX0 <= OUTPUT_7SEGMENT_0;
    
    -- LEDs vermelhos para representar o resultado das operações lógicas
    G_LEDR <= OUTPUT_RLEDS;

    -- O seletor recebe os valores determinados pelos switches da placa FPGA
    seletor  <= V_SW;
    
    -- LEDs verdes para representar as flags vindas da ULA
    G_LEDG <= OUTPUT_GLEDS;
    
    -- Precisamos de uma lógica para representar um valor a cada segundo. Para isso, será necessário um divisor de frequência para cada operando.
    
    -- Divisor de frequência para o operando a:
    PROCESS(G_CLOCK_50, V_BT)
      BEGIN
        -- Reseta a contagem ao apertar o botão "KEY0" da placa FPGA
        IF V_BT(0) = '0' THEN
	        FREQ_DIVIDER_a <= 1;                    
        -- A cada subida de clock, soma 1 ao FREQ_DIVIDER_a
        ELSIF rising_edge(G_CLOCK_50) THEN
	        FREQ_DIVIDER_a <= FREQ_DIVIDER_a + 1;
        END IF;
    END PROCESS;
    
    -- Contador para o operando a:
    PROCESS(G_CLOCK_50, V_BT)
      BEGIN
        -- Reseta a contagem ao apertar o botão "KEY0" da placa FPGA
        IF V_BT(0) = '0' THEN
	        COUNT_a <= "0000";
        -- A cada subida de clock, soma 1 ao FREQ_DIVIDER_a
        ELSIF rising_edge(G_CLOCK_50) THEN
        	IF FREQ_DIVIDER_a = 50000000 AND COUNT_b = "1111" THEN
        -- Quando a contagem de b chegar em "1111", adiciona 1 à contagem de a 	          
	          COUNT_a <= COUNT_a + 1;
            END IF;
        END IF;
    END PROCESS;

    -- Divisor de frequência para o operando b:
    PROCESS(G_CLOCK_50, V_BT)
      BEGIN
        -- Reseta a contagem ao apertar o botão "KEY0" da placa FPGA
        IF V_BT(0) = '0' THEN
	        FREQ_DIVIDER_b <= 1;
        -- A cada subida de clock, soma 1 ao FREQ_DIVIDER_b
        ELSIF rising_edge(G_CLOCK_50) THEN
	        FREQ_DIVIDER_b <= FREQ_DIVIDER_b + 1;
        END IF;
    END PROCESS;
    
    -- Contador para o operando b:
    PROCESS(G_CLOCK_50, V_BT)
      BEGIN
        -- Reseta a contagem ao apertar o botão "KEY0" da placa FPGA
        IF V_BT(0) = '0' THEN
	        COUNT_b <= "0000";
        ELSIF rising_edge(G_CLOCK_50) THEN
        -- Quando o divisor de frequência atingir 50 MHz (após 1 segundo), adiciona 1 à contagem de b
        	IF FREQ_DIVIDER_b = 50000000 THEN
	          COUNT_b <= COUNT_b + 1;
            END IF;
        END IF;
    END PROCESS;
    
    -- Listando a faixa de números de 4 bits representáveis em complemento de 2
    PROCESS(COUNT_a, COUNT_b, SAIDA)
      BEGIN
      
        -- Para o operando A:
        CASE COUNT_a IS
			WHEN "0000" => OUTPUT_7SEGMENT_6 <= "1000000"; --  0 
			WHEN "0001" => OUTPUT_7SEGMENT_6 <= "1111001"; --  1 
			WHEN "0010" => OUTPUT_7SEGMENT_6 <= "0100100"; --  2 
			WHEN "0011" => OUTPUT_7SEGMENT_6 <= "0110000"; --  3
			WHEN "0100" => OUTPUT_7SEGMENT_6 <= "0011001"; --  4
			WHEN "0101" => OUTPUT_7SEGMENT_6 <= "0010010"; --  5
			WHEN "0110" => OUTPUT_7SEGMENT_6 <= "0000010"; --  6
			WHEN "0111" => OUTPUT_7SEGMENT_6 <= "1111000"; --  7 
			WHEN "1000" => OUTPUT_7SEGMENT_6 <= "0000000"; -- -8
			WHEN "1001" => OUTPUT_7SEGMENT_6 <= "1111000"; -- -7 
			WHEN "1010" => OUTPUT_7SEGMENT_6 <= "0000010"; -- -6
			WHEN "1011" => OUTPUT_7SEGMENT_6 <= "0010010"; -- -5 
			WHEN "1100" => OUTPUT_7SEGMENT_6 <= "0011001"; -- -4 
			WHEN "1101" => OUTPUT_7SEGMENT_6 <= "0110000"; -- -3 
			WHEN "1110" => OUTPUT_7SEGMENT_6 <= "0100100"; -- -2
			WHEN "1111" => OUTPUT_7SEGMENT_6 <= "1111001"; -- -1 
			WHEN OTHERS => OUTPUT_7SEGMENT_6 <= "1111111"; -- apaga display
        END CASE;
        
        -- Para o operando B:
        CASE COUNT_b IS
			WHEN "0000" => OUTPUT_7SEGMENT_4 <= "1000000"; --  0 
			WHEN "0001" => OUTPUT_7SEGMENT_4 <= "1111001"; --  1 
			WHEN "0010" => OUTPUT_7SEGMENT_4 <= "0100100"; --  2 
			WHEN "0011" => OUTPUT_7SEGMENT_4 <= "0110000"; --  3
			WHEN "0100" => OUTPUT_7SEGMENT_4 <= "0011001"; --  4
			WHEN "0101" => OUTPUT_7SEGMENT_4 <= "0010010"; --  5
			WHEN "0110" => OUTPUT_7SEGMENT_4 <= "0000010"; --  6
			WHEN "0111" => OUTPUT_7SEGMENT_4 <= "1111000"; --  7 
			WHEN "1000" => OUTPUT_7SEGMENT_4 <= "0000000"; -- -8
			WHEN "1001" => OUTPUT_7SEGMENT_4 <= "1111000"; -- -7 
			WHEN "1010" => OUTPUT_7SEGMENT_4 <= "0000010"; -- -6
			WHEN "1011" => OUTPUT_7SEGMENT_4 <= "0010010"; -- -5 
			WHEN "1100" => OUTPUT_7SEGMENT_4 <= "0011001"; -- -4 
			WHEN "1101" => OUTPUT_7SEGMENT_4 <= "0110000"; -- -3 
			WHEN "1110" => OUTPUT_7SEGMENT_4 <= "0100100"; -- -2
			WHEN "1111" => OUTPUT_7SEGMENT_4 <= "1111001"; -- -1 
			WHEN OTHERS => OUTPUT_7SEGMENT_4 <= "1111111"; -- apaga display
        END CASE;
        
        -- Para o resultado:
        CASE SAIDA IS
			WHEN "0000" => OUTPUT_7SEGMENT_0 <= "1000000"; --  0 
			WHEN "0001" => OUTPUT_7SEGMENT_0 <= "1111001"; --  1 
			WHEN "0010" => OUTPUT_7SEGMENT_0 <= "0100100"; --  2 
			WHEN "0011" => OUTPUT_7SEGMENT_0 <= "0110000"; --  3
			WHEN "0100" => OUTPUT_7SEGMENT_0 <= "0011001"; --  4
			WHEN "0101" => OUTPUT_7SEGMENT_0 <= "0010010"; --  5
			WHEN "0110" => OUTPUT_7SEGMENT_0 <= "0000010"; --  6
			WHEN "0111" => OUTPUT_7SEGMENT_0 <= "1111000"; --  7 
			WHEN "1000" => OUTPUT_7SEGMENT_0 <= "0000000"; -- -8
			WHEN "1001" => OUTPUT_7SEGMENT_0 <= "1111000"; -- -7 
			WHEN "1010" => OUTPUT_7SEGMENT_0 <= "0000010"; -- -6
			WHEN "1011" => OUTPUT_7SEGMENT_0 <= "0010010"; -- -5 
			WHEN "1100" => OUTPUT_7SEGMENT_0 <= "0011001"; -- -4 
			WHEN "1101" => OUTPUT_7SEGMENT_0 <= "0110000"; -- -3 
			WHEN "1110" => OUTPUT_7SEGMENT_0 <= "0100100"; -- -2
			WHEN "1111" => OUTPUT_7SEGMENT_0 <= "1111001"; -- -1 
			WHEN OTHERS => OUTPUT_7SEGMENT_0 <= "1111111"; -- apaga display
        END CASE;
        
        -- Apagando os displays apenas quando uma operação lógica é selecionada
        CASE seletor IS
            WHEN "101" => OUTPUT_7SEGMENT_6 <= "1111111";
                          OUTPUT_7SEGMENT_4 <= "1111111";
                          OUTPUT_7SEGMENT_0 <= "1111111";

            WHEN "110" => OUTPUT_7SEGMENT_6 <= "1111111";
                          OUTPUT_7SEGMENT_4 <= "1111111";
                          OUTPUT_7SEGMENT_0 <= "1111111";                          
                          
            WHEN "111" => OUTPUT_7SEGMENT_6 <= "1111111";
                          OUTPUT_7SEGMENT_4 <= "1111111";
                          OUTPUT_7SEGMENT_0 <= "1111111";                            
            
            WHEN OTHERS => NULL;
        END CASE;
            
    END PROCESS;    
    
-- Adicionando sinal negativo aos displays, quando necessário

    PROCESS(COUNT_a, COUNT_b, flagsinal)
        BEGIN
        
        -- Para o operando A:
        CASE COUNT_a(3) IS
            WHEN '1' => OUTPUT_7SEGMENT_7 <= "0111111";
            WHEN OTHERS => OUTPUT_7SEGMENT_7 <= "1111111";
        END CASE;
        
        -- Para o operando B:    
        CASE COUNT_b(3) IS
            WHEN '1' => OUTPUT_7SEGMENT_5 <= "0111111";
            WHEN OTHERS => OUTPUT_7SEGMENT_5 <= "1111111";      
        END CASE;
        
        -- Para o resultado:
        CASE flagsinal IS
            WHEN '1' => OUTPUT_7SEGMENT_1 <= "0111111";
            WHEN OTHERS => OUTPUT_7SEGMENT_1 <= "1111111";
        END CASE;
        
        -- Apagando os displays apenas quando uma operação lógica é selecionada
        CASE seletor IS
            WHEN "101" => OUTPUT_7SEGMENT_7 <= "1111111";
                          OUTPUT_7SEGMENT_5 <= "1111111";
                          OUTPUT_7SEGMENT_1 <= "1111111";

            WHEN "110" => OUTPUT_7SEGMENT_7 <= "1111111";
                          OUTPUT_7SEGMENT_5 <= "1111111";
                          OUTPUT_7SEGMENT_1 <= "1111111";                          
                          
            WHEN "111" => OUTPUT_7SEGMENT_7 <= "1111111";
                          OUTPUT_7SEGMENT_5 <= "1111111";
                          OUTPUT_7SEGMENT_1 <= "1111111";                            
            
            WHEN OTHERS => NULL;
        END CASE;        
    END PROCESS;    
    
-- Acendendo LEDS apenas quando uma operação lógica é selecionada

    PROCESS(seletor, COUNT_a, COUNT_b, SAIDA)
        BEGIN
        
        -- Para o operando A:
        CASE seletor IS
            WHEN "101" => OUTPUT_RLEDS(17 DOWNTO 14) <= COUNT_a;
            WHEN "110" => OUTPUT_RLEDS(17 DOWNTO 14) <= COUNT_a;
            WHEN "111" => OUTPUT_RLEDS(17 DOWNTO 14) <= COUNT_a;
            WHEN OTHERS => OUTPUT_RLEDS(17 DOWNTO 14) <= "0000";
        END CASE;    
        
        -- Para o operando B:
        CASE seletor IS
            WHEN "101" => OUTPUT_RLEDS(12 DOWNTO 9) <= COUNT_b;
            WHEN "110" => OUTPUT_RLEDS(12 DOWNTO 9) <= COUNT_b;
            WHEN "111" => OUTPUT_RLEDS(12 DOWNTO 9) <= COUNT_b;
            WHEN OTHERS => OUTPUT_RLEDS(12 DOWNTO 9) <= "0000";
        END CASE; 
        
        -- Para o resultado:
        CASE seletor IS
            WHEN "101" => OUTPUT_RLEDS(7 DOWNTO 4) <= SAIDA;
            WHEN "110" => OUTPUT_RLEDS(7 DOWNTO 4) <= SAIDA;
            WHEN "111" => OUTPUT_RLEDS(7 DOWNTO 4) <= SAIDA;
            WHEN OTHERS => OUTPUT_RLEDS(7 DOWNTO 4) <= "0000";
        END CASE;    
    END PROCESS;

-- Exibindo as flags:

    PROCESS(seletor)
        BEGIN
        CASE seletor IS
        -- Quando são selecionadas operações lógicas, vamos mostrar apenas a flag zero.
            WHEN "101" => OUTPUT_GLEDS <= "00" & flagzero & "0"; 
            WHEN "110" => OUTPUT_GLEDS <= "00" & flagzero & "0"; 
            WHEN "111" => OUTPUT_GLEDS <= "00" & flagzero & "0"; 
            
        -- Caso não selecionemos operações lógicas, as flags aparecem normalmente.
            WHEN OTHERS => OUTPUT_GLEDS <= (flagCout,flagovflw,flagzero,flagsinal);
        END CASE;        
    END PROCESS;        
        
END TOP;