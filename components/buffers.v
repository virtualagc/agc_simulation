`ifndef _BUFFERS_V_
`define _BUFFERS_V_

module od_buf(y, a);
    parameter delay = 2;
    input wire a;
    output reg y;
    always @(*) begin
        if (a) #delay y = 1'bZ;
        else #delay y = 1'b0;
    end
endmodule

`endif
