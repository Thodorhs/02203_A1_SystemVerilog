// -----------------------------------------------------------------------------
//
//  Title      :  System Verilog FSMD implementation template for GCD
//             :
//  Developers :  Otto Westy Rasmussen
//             :
//  Purpose    :  This is a template for the FSMD (finite state machine with datapath) 
//             :  implementation of the GCD circuit
//             :
//  Revision   :  02203 fall 2025 v.1.0
//
// -----------------------------------------------------------------------------


module gcd (
    input  logic          clk,    // The clock signal.
    input  logic          reset,  // Reset the module.
    input  logic          req,    // Start computation.
    input  logic [15 : 0] AB,     // The two operands. One at a time.
    output logic          ack,    // Input received / Computation is complete.
    output logic [15 : 0] C       // The result.
);
    typedef enum logic [3 : 0] { IDLE, PASS_A, WAIT_B, PASS_B, ACK_A, ACK_B, SEL_OP, ALU_OP, RES_0  } state_t; // Input your own state names here
    shortint unsigned reg_a, next_reg_a, reg_b, next_reg_b, src1, src2, r;
    state_t state, next_state;
    

    // Combinatorial logic
    always_comb begin
        ack = 0;
        C = '0;
        next_state = state;
        next_reg_a = reg_a;
        next_reg_b = reg_b;
            
        case (state)
            IDLE: 
            begin
                if (req) next_state = PASS_A;
            end
            
            PASS_A:
            begin  
                next_reg_a = AB;
                next_state = ACK_A;
            end
            
            ACK_A:
            begin
                ack = 1;
                if(req == 0) next_state = WAIT_B;
            end
            
            WAIT_B:
            begin
                 if (req) next_state = PASS_B;
            end
            
            PASS_B:
            begin
                next_reg_b = AB;
                next_state = SEL_OP;
            end
            
            SEL_OP:
            begin
                if (reg_a == reg_b) next_state = RES_0;
                else next_state = ALU_OP;
            end
            
            ALU_OP:
            begin
                if (reg_a > reg_b) next_reg_a = reg_a - reg_b;
                else next_reg_b = reg_b - reg_a;
                
                next_state = SEL_OP;
            end
            
            RES_0:
            begin
                C = reg_a;
                ack = 1;
                if (req == 0) next_state = IDLE; //after release
            end
            default: next_state = IDLE;
        endcase
    end

        // Register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            reg_a <= '0;
            reg_b <= '0;
        end else begin
            state <= next_state;
            reg_a <= next_reg_a;
            reg_b <= next_reg_b;
        end
    end

endmodule