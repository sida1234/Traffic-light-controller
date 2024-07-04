`timescale 1ns / 1ps
module traffic_light(
    input reset,input clk,output reg[2:0]m1,output reg[2:0]m2,
    output reg[2:0]mt,output reg [2:0]s

);
    parameter a=1,b=2,c=3,d=4,e=5,f=6;
    reg[2:0]next ,state;
    reg[3:0]count;
    parameter sec1=7,sec2=2,sec3=5,sec4=3;

    
       
       initial begin
       state<=0;
    end
       
    always@(posedge clk or posedge reset)begin
        if(reset)begin
            count<=0;
            state<=a;
        end
        else begin
            if(state==next)
                count<=count+1;
            else begin
                count<=0;
                state<=next;
            end

        end
    end

    always@(*)begin 
        case(state)
            a:begin
                if(count>=sec1)
                    next<=b;
                else
                    next<=a;
            end
            b:begin
                if(count>=sec2)
                    next<=c;
                else
                    next<=b;
            end
            c:begin
                if(count>=sec3)
                    next<=d;
                else
                    next<=c;
            end
            d:begin
                if(count>=sec2)
                    next<=e;
                else
                    next<=d;
            end
            e:begin
                if(count>=sec4)
                    next<=f;
                else
                    next<=e;
            end
            f:begin
                if(count>=sec4)
                    next<=a;
                else
                    next<=f;
            end
            default:
                next<=a;

        endcase
    end

    always@(state)begin
        case(state)
            a: begin // red ,yellow ,green
                m1=3'b001; // main road
                m2=3'b001; // second road + turn from there
                mt=3'b100; // turn from main road
                s=3'b100; // skide turn from the main road
            end
            b: begin
                m1=3'b001;
                m2=3'b010;
                mt=3'b100;
                s=3'b100;
            end
            c: begin
                m1=3'b001;
                m2=3'b100;
                mt=3'b001;
                s=3'b100;
            end
            d: begin
                m1=3'b010;
                m2=3'b100;
                mt=3'b010;
                s=3'b100;
            end
            e: begin
                m1=3'b100;
                m2=3'b100;
                mt=3'b100;
                s=3'b001;
            end
            f: begin
                m1=3'b100;
                m2=3'b100;
                mt=3'b100;
                s=3'b010;
            end
          
            
        endcase
    end


endmodule
