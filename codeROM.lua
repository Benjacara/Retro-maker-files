-- MODULE SCRIPT --

local cROM = {}
local codeExplanations = { -- text that will appear in popup when option is selected, mainly handled in "popups" module script, i will later add code functions :)
	["LDA"] = " [REQUIRES NUMBER], loads number from value specified or the value from specified adress to the A register, commonly known as the accumulator",
	["STA"] = " [REQUIRES MEMORY ADRESS], stores whatever value thats in the A register to the memory address provided in the required value slot",
	["CMP"] = " [REQUIRES NUMBER], compares the A register to the value in the opperand, can add numbers with numbers from registers A, X, and Y",
	
	["LDX"] = " [REQUIRES NUMBER], loads number from value specified or the value from specified adress to the X register,",
	["STX"] = " [REQUIRES MEMORY ADRESS], stores whatever value thats in the X register to the memory address provided in the required value slot",
	["INX"] = "increments the X register by 1. Does not use any opperands | the usage of opperands will crash the console | wraps around to -255/-FF if the value increments over 255",
	["DEX"] = "decrements the X register by 1, Does not use any operands | the usage of opperands will crash the console | wraps around to 255/FF if the value decrements below -255",
	["CPX"] = " [REQUIRES NUMBER], compares the X register to the value in the opperand, can add numbers with numbers from registers A, X, and Y",
	
	["LDY"] = " [REQUIRES NUMBER], loads number from value specified or the value from specified adress to the Y register,",
	["STY"] = " [REQUIRES MEMORY ADRESS], stores whatever value thats in the Y register to the memory address provided in the required value slot",
	["INY"] = "increments the Y register by 1. Does not use any opperands | the usage of opperands will crash the console | wraps around to -255/-FF if the value increments over 255",
	["DEY"] = "decrements the Y register by 1, Does not use any operands | the usage of opperands will crash the console | wraps around to 255/FF if the value decrements below -255",
	["CPY"] = " [REQUIRES NUMBER], compares the Y register to the value in the opperand, can add numbers with numbers from registers A, X, and Y",
	
	["BEQ"] = "Branches if the comparison of var A is equal to var B or var B + var C",
	["JMP"] = " [REQUIRES NAME OF SUB ROUTINE], Jumps to the specified sub routine ",
	
	["TAX"] = "Transfers value from accumulator to X register",
	["TAY"] = "Transfers value from accumulator to Y register",
	["TXA"] = "Transfers value from X register to Accumulator",
	["TYA"] = "Transfers value from Y register to Accumulator",
	["TSX"] = "Transfers value from accumulator to X register",
	["TXS"] = "Transfers value from accumulator to X register",
	
	["INC"] = " [REQUIRES MEMORY ADRESS], decrements the value from specified memory adress | Without opperands/ a specified adress, it will crash the console | wraps around to -255/-FF if the value increments over 255",
	["DEC"] = " [REQUIRES MEMORY ADRESS], decrements the value from specified memory adress | Without opperands/ a specified adress, it will crash the console | wraps around to 255/FF if the value decrements under 255",
}
-- * generates a header, without *, it generates an selection option
local avaiableCodeList = {
	"*A register",
	"LDA",
	"STA",
	"CMP",
	
	"*X register",
	"LDX",
	"STX",
	"INX",
	"DEX",
	"CPX",
	
	"*Y register",
	"LDY",
	"STY",
	"INY",
	"DEY",
	"CPY",
	
	"*Comparison related",
	"BEQ",
	
	"*Code jumping",
	"JMP",
	
	"*Variable transfers",
	"TAX",
	"TAY",
	"TXA",
	"TYA",
	"TSX",
	"TXS",
	
	"*Direct memory manipulation",
	"INC",
	"DEC",
	
	"*"
}
function cROM.fetchCodeList ()
	return avaiableCodeList
end
function cROM.fetchCodeListItemWithIndex (i)
	return avaiableCodeList[i] or "error"
end
function cROM.fetchCodeExplanationList ()
	print(codeExplanations)
	return codeExplanations
end
function cROM.fetchCodeExplanationWithString (s)
	return codeExplanations[s]
end
return cROM
