module register_file(
    input  logic        clk,
    input  logic        rst,             // active-high
    input  logic [4:0]  A1, A2, A3,      // rs, rt, rd
    input  logic [31:0] WD3,             // write data
    input  logic        WE3,             // write enable
    output logic [31:0] RD1, RD2,        // read data
    output logic [31:0] prode            // expose R[1] for display
);
    logic [31:0] R [31:0];

    // initialize to R[i]=i (helps sim) and also re-init on rst
    initial begin
        for (int i = 0; i < 32; i++) R[i] = i;
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < 32; i++) R[i] <= i;
        end else if (WE3) begin
            R[A3] <= WD3;
        end
    end

    assign RD1  = R[A1];
    assign RD2  = R[A2];
    assign prode = R[1];
endmodule
