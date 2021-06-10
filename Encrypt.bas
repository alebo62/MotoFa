B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9
@EndOfDesignText@
Sub Class_Globals
	Public u_auth_key(4) As Int
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	
End Sub

Public Sub encipher(v() As Int, w() As Int)
        
	Dim u_auth_key(4) As Int
	Dim delta As Int = 0x9E3779B9
	u_auth_key(0) = 0x152C7E9D
	u_auth_key(1) = 0x38BE41C7
	u_auth_key(2) = 0x71E96CA4
	u_auth_key(3) = 0x6CAC1AFC
	Dim y As Int = v(0)
	Dim z As Int = v(1)
	Dim sum As Int = 0
	Dim a As Int = u_auth_key(0)
	Dim b As Int = u_auth_key(1)
	Dim c As Int = u_auth_key(2)
	Dim d As Int = u_auth_key(3)
	Dim n As Int = 32

    Dim t1,t2,t3 As Int
	Do While n > 0
		sum = sum + delta
		'y = y + (((z << 4) + a) ^ (z + sum) ^ ((z >>> 5) + b))
		t1 = Bit.ShiftLeft(z,4) + a
		t2 = z + sum
		t3 = Bit.UnsignedShiftRight(z, 5) + b
		t1 = Bit.Xor(t1,t2)
		t1 = Bit.Xor(t1,t3)
		y = y + t1
			
		'z = z + (((y << 4) + c) ^ (y + sum) ^ ((y >>> 5) + d))
		t1 = Bit.ShiftLeft(z,4) + c
		t2 = z + sum
		t3 = Bit.UnsignedShiftRight(z, 5) + d
		t1 = Bit.Xor(t1,t2)
		t1 = Bit.Xor(t1,t3)
		z = z + t1
		
		n = n - 1
	Loop
		
	w(0) = y
	w(1) = z
	
End Sub
    