/* Generated by Yosys 0.9+2406 (git sha1 UNKNOWN, gcc 4.8.5 -fPIC -Os) */

(* generator = "nMigen" *)
(* top =  1  *)
(* \nmigen.hierarchy  = "top" *)
module SARlogic(cmp, EOC, res, DAC_control, SE, clk, rst, SOC);
  (* src = "SARlogic_step1.py:32" *)
  wire \$1 ;
  (* src = "SARlogic_step1.py:69" *)
  wire [7:0] \$11 ;
  (* src = "SARlogic_step1.py:72" *)
  wire \$13 ;
  (* src = "SARlogic_step1.py:74" *)
  wire [7:0] \$15 ;
  (* src = "SARlogic_step1.py:32" *)
  wire \$17 ;
  (* src = "SARlogic_step1.py:72" *)
  wire \$19 ;
  (* src = "SARlogic_step1.py:78" *)
  wire [7:0] \$21 ;
  (* src = "SARlogic_step1.py:32" *)
  wire \$23 ;
  (* src = "SARlogic_step1.py:84" *)
  wire \$25 ;
  (* src = "SARlogic_step1.py:32" *)
  wire \$27 ;
  (* src = "SARlogic_step1.py:72" *)
  wire \$29 ;
  (* src = "SARlogic_step1.py:84" *)
  wire \$3 ;
  (* src = "SARlogic_step1.py:80" *)
  wire [3:0] \$31 ;
  (* src = "SARlogic_step1.py:80" *)
  wire [3:0] \$32 ;
  (* src = "SARlogic_step1.py:84" *)
  wire \$34 ;
  (* src = "SARlogic_step1.py:66" *)
  wire [8:0] \$36 ;
  (* src = "SARlogic_step1.py:66" *)
  wire [8:0] \$37 ;
  (* src = "SARlogic_step1.py:72" *)
  wire \$39 ;
  (* src = "SARlogic_step1.py:76" *)
  wire [8:0] \$41 ;
  (* src = "SARlogic_step1.py:76" *)
  wire [8:0] \$42 ;
  (* src = "SARlogic_step1.py:84" *)
  wire \$44 ;
  (* src = "SARlogic_step1.py:72" *)
  wire \$46 ;
  (* src = "SARlogic_step1.py:32" *)
  wire \$5 ;
  (* src = "SARlogic_step1.py:84" *)
  wire \$7 ;
  (* src = "SARlogic_step1.py:32" *)
  wire \$9 ;
  (* src = "SARlogic_step1.py:16" *)
  output [7:0] DAC_control;
  reg [7:0] DAC_control = 8'h00;
  (* src = "SARlogic_step1.py:16" *)
  reg [7:0] \DAC_control$next ;
  (* src = "SARlogic_step1.py:14" *)
  output EOC;
  reg EOC = 1'h0;
  (* src = "SARlogic_step1.py:14" *)
  reg \EOC$next ;
  (* src = "SARlogic_step1.py:17" *)
  output SE;
  reg SE = 1'h0;
  (* src = "SARlogic_step1.py:17" *)
  reg \SE$next ;
  (* src = "SARlogic_step1.py:10" *)
  input SOC;
  (* src = "SARlogic_step1.py:26" *)
  reg [7:0] bitToConvert = 8'h01;
  (* src = "SARlogic_step1.py:26" *)
  reg [7:0] \bitToConvert$next ;
  (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/ir.py:526" *)
  input clk;
  (* src = "SARlogic_step1.py:11" *)
  input cmp;
  (* src = "SARlogic_step1.py:29" *)
  reg [1:0] fsm_state = 2'h0;
  (* src = "SARlogic_step1.py:29" *)
  reg [1:0] \fsm_state$next ;
  (* src = "SARlogic_step1.py:27" *)
  reg [2:0] i = 3'h0;
  (* src = "SARlogic_step1.py:27" *)
  reg [2:0] \i$next ;
  (* src = "SARlogic_step1.py:15" *)
  output [7:0] res;
  reg [7:0] res = 8'h00;
  (* src = "SARlogic_step1.py:15" *)
  reg [7:0] \res$next ;
  (* src = "SARlogic_step1.py:25" *)
  reg [7:0] res_intern = 8'h00;
  (* src = "SARlogic_step1.py:25" *)
  reg [7:0] \res_intern$next ;
  (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/ir.py:526" *)
  input rst;
  assign \$9  = SOC == (* src = "SARlogic_step1.py:32" *) 1'h1;
  assign \$11  = res_intern | (* src = "SARlogic_step1.py:69" *) bitToConvert;
  assign \$13  = i < (* src = "SARlogic_step1.py:72" *) 4'h8;
  assign \$15  = res_intern | (* src = "SARlogic_step1.py:74" *) bitToConvert;
  assign \$17  = SOC == (* src = "SARlogic_step1.py:32" *) 1'h1;
  assign \$1  = SOC == (* src = "SARlogic_step1.py:32" *) 1'h1;
  assign \$19  = i < (* src = "SARlogic_step1.py:72" *) 4'h8;
  assign \$21  = res_intern | (* src = "SARlogic_step1.py:78" *) bitToConvert;
  assign \$23  = SOC == (* src = "SARlogic_step1.py:32" *) 1'h1;
  assign \$25  = i == (* src = "SARlogic_step1.py:84" *) 3'h7;
  assign \$27  = SOC == (* src = "SARlogic_step1.py:32" *) 1'h1;
  assign \$29  = i < (* src = "SARlogic_step1.py:72" *) 4'h8;
  assign \$32  = i + (* src = "SARlogic_step1.py:80" *) 1'h1;
  assign \$34  = i == (* src = "SARlogic_step1.py:84" *) 3'h7;
  assign \$37  = bitToConvert <<< (* src = "SARlogic_step1.py:66" *) 1'h1;
  assign \$3  = i == (* src = "SARlogic_step1.py:84" *) 3'h7;
  assign \$39  = i < (* src = "SARlogic_step1.py:72" *) 4'h8;
  assign \$42  = bitToConvert <<< (* src = "SARlogic_step1.py:76" *) 1'h1;
  assign \$44  = i == (* src = "SARlogic_step1.py:84" *) 3'h7;
  assign \$46  = i < (* src = "SARlogic_step1.py:72" *) 4'h8;
  assign \$5  = SOC == (* src = "SARlogic_step1.py:32" *) 1'h1;
  assign \$7  = i == (* src = "SARlogic_step1.py:84" *) 3'h7;
  always @(posedge clk)
      res <= \res$next ;
  always @(posedge clk)
      bitToConvert <= \bitToConvert$next ;
  always @(posedge clk)
      i <= \i$next ;
  always @(posedge clk)
      SE <= \SE$next ;
  always @(posedge clk)
      DAC_control <= \DAC_control$next ;
  always @(posedge clk)
      res_intern <= \res_intern$next ;
  always @(posedge clk)
      EOC <= \EOC$next ;
  always @(posedge clk)
      fsm_state <= \fsm_state$next ;
  always @* begin
    \fsm_state$next  = fsm_state;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:30" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          (* src = "SARlogic_step1.py:32" *)
          casez (\$1 )
            /* src = "SARlogic_step1.py:32" */
            1'h1:
                \fsm_state$next  = 2'h1;
            /* src = "SARlogic_step1.py:43" */
            default:
                \fsm_state$next  = 2'h0;
          endcase
      /* src = "SARlogic_step1.py:55" */
      /* \nmigen.decoding  = "SAMPLING/1" */
      2'h1:
          \fsm_state$next  = 2'h2;
      /* src = "SARlogic_step1.py:62" */
      /* \nmigen.decoding  = "HOLD/2" */
      2'h2:
          \fsm_state$next  = 2'h3;
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
          (* src = "SARlogic_step1.py:84" *)
          casez (\$3 )
            /* src = "SARlogic_step1.py:84" */
            1'h1:
                (* src = "SARlogic_step1.py:89" *)
                casez (SOC)
                  /* src = "SARlogic_step1.py:89" */
                  1'h1:
                      \fsm_state$next  = 2'h2;
                  /* src = "SARlogic_step1.py:92" */
                  default:
                      \fsm_state$next  = 2'h0;
                endcase
          endcase
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \fsm_state$next  = 2'h0;
    endcase
  end
  always @* begin
    \EOC$next  = EOC;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:30" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          (* src = "SARlogic_step1.py:32" *)
          casez (\$5 )
            /* src = "SARlogic_step1.py:32" */
            1'h1:
                \EOC$next  = 1'h0;
            /* src = "SARlogic_step1.py:43" */
            default:
                \EOC$next  = 1'h0;
          endcase
      /* src = "SARlogic_step1.py:55" */
      /* \nmigen.decoding  = "SAMPLING/1" */
      2'h1:
          \EOC$next  = 1'h0;
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
          (* src = "SARlogic_step1.py:84" *)
          casez (\$7 )
            /* src = "SARlogic_step1.py:84" */
            1'h1:
                \EOC$next  = 1'h1;
          endcase
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \EOC$next  = 1'h0;
    endcase
  end
  always @* begin
    \res_intern$next  = res_intern;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:30" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          (* src = "SARlogic_step1.py:32" *)
          casez (\$9 )
            /* src = "SARlogic_step1.py:32" */
            1'h1:
                \res_intern$next  = 8'h00;
            /* src = "SARlogic_step1.py:43" */
            default:
                \res_intern$next  = 8'h00;
          endcase
      /* src = "SARlogic_step1.py:62" */
      /* \nmigen.decoding  = "HOLD/2" */
      2'h2:
          (* src = "SARlogic_step1.py:68" *)
          casez (cmp)
            /* src = "SARlogic_step1.py:68" */
            1'h1:
                \res_intern$next  = \$11 ;
          endcase
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
          (* src = "SARlogic_step1.py:72" *)
          casez (\$13 )
            /* src = "SARlogic_step1.py:72" */
            1'h1:
                (* src = "SARlogic_step1.py:73" *)
                casez (cmp)
                  /* src = "SARlogic_step1.py:73" */
                  1'h1:
                      \res_intern$next  = \$15 ;
                endcase
          endcase
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \res_intern$next  = 8'h00;
    endcase
  end
  always @* begin
    \DAC_control$next  = DAC_control;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:30" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          (* src = "SARlogic_step1.py:32" *)
          casez (\$17 )
            /* src = "SARlogic_step1.py:32" */
            1'h1:
                \DAC_control$next  = 8'h00;
            /* src = "SARlogic_step1.py:43" */
            default:
                \DAC_control$next  = 8'h00;
          endcase
      /* src = "SARlogic_step1.py:62" */
      /* \nmigen.decoding  = "HOLD/2" */
      2'h2:
          \DAC_control$next  = 8'h01;
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
          (* src = "SARlogic_step1.py:72" *)
          casez (\$19 )
            /* src = "SARlogic_step1.py:72" */
            1'h1:
                \DAC_control$next  = \$21 ;
          endcase
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \DAC_control$next  = 8'h00;
    endcase
  end
  always @* begin
    \SE$next  = SE;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:30" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          (* src = "SARlogic_step1.py:32" *)
          casez (\$23 )
            /* src = "SARlogic_step1.py:32" */
            1'h1:
                \SE$next  = 1'h1;
            /* src = "SARlogic_step1.py:43" */
            default:
                \SE$next  = 1'h0;
          endcase
      /* src = "SARlogic_step1.py:55" */
      /* \nmigen.decoding  = "SAMPLING/1" */
      2'h1:
          \SE$next  = 1'h0;
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
          (* src = "SARlogic_step1.py:84" *)
          casez (\$25 )
            /* src = "SARlogic_step1.py:84" */
            1'h1:
                (* src = "SARlogic_step1.py:89" *)
                casez (SOC)
                  /* src = "SARlogic_step1.py:89" */
                  1'h1:
                      \SE$next  = 1'h1;
                  /* src = "SARlogic_step1.py:92" */
                  default:
                      \SE$next  = 1'h0;
                endcase
          endcase
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \SE$next  = 1'h0;
    endcase
  end
  always @* begin
    \i$next  = i;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:30" */
      /* \nmigen.decoding  = "IDLE/0" */
      2'h0:
          (* src = "SARlogic_step1.py:32" *)
          casez (\$27 )
            /* src = "SARlogic_step1.py:32" */
            1'h1:
                \i$next  = 3'h0;
            /* src = "SARlogic_step1.py:43" */
            default:
                \i$next  = 3'h0;
          endcase
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
        begin
          (* src = "SARlogic_step1.py:72" *)
          casez (\$29 )
            /* src = "SARlogic_step1.py:72" */
            1'h1:
                \i$next  = \$31 [2:0];
          endcase
          (* src = "SARlogic_step1.py:84" *)
          casez (\$34 )
            /* src = "SARlogic_step1.py:84" */
            1'h1:
                \i$next  = 3'h0;
          endcase
        end
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \i$next  = 3'h0;
    endcase
  end
  always @* begin
    \bitToConvert$next  = bitToConvert;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:55" */
      /* \nmigen.decoding  = "SAMPLING/1" */
      2'h1:
          \bitToConvert$next  = 8'h01;
      /* src = "SARlogic_step1.py:62" */
      /* \nmigen.decoding  = "HOLD/2" */
      2'h2:
          \bitToConvert$next  = \$36 [7:0];
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
        begin
          (* src = "SARlogic_step1.py:72" *)
          casez (\$39 )
            /* src = "SARlogic_step1.py:72" */
            1'h1:
                \bitToConvert$next  = \$41 [7:0];
          endcase
          (* src = "SARlogic_step1.py:84" *)
          casez (\$44 )
            /* src = "SARlogic_step1.py:84" */
            1'h1:
                \bitToConvert$next  = 8'h01;
          endcase
        end
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \bitToConvert$next  = 8'h01;
    endcase
  end
  always @* begin
    \res$next  = res;
    (* src = "SARlogic_step1.py:29" *)
    casez (fsm_state)
      /* src = "SARlogic_step1.py:71" */
      /* \nmigen.decoding  = "CONVERSION/3" */
      2'h3:
          (* src = "SARlogic_step1.py:72" *)
          casez (\$46 )
            /* src = "SARlogic_step1.py:72" */
            1'h1:
                \res$next  = res_intern;
          endcase
    endcase
    (* src = "/usr/lib/python3.6/site-packages/nmigen/hdl/xfrm.py:530" *)
    casez (rst)
      1'h1:
          \res$next  = 8'h00;
    endcase
  end
  assign \$31  = \$32 ;
  assign \$36  = \$37 ;
  assign \$41  = \$42 ;
endmodule