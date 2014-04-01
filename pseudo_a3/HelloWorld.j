.class public HelloWorld
.super java/lang/Object

.method public init()V
  aload_0
  invokenonvirtual java/lang/Object/init()V
  return
.end method

.method public static main([Ljava/lang/String;)V
  .limit stack  10
  .limit locals 10
  
    ; -----------------------------------
    ; for(i=0; i < 5; i++)
    ;   System.out.println(i)

            ; i = 0
            ldc 0
            istore 0

    begin_for:
            ; System.out.println("Hello World");
            getstatic java/lang/System/out Ljava/io/PrintStream;
            
            ; Convert var<0> to a string on top of the stack
            new java/lang/StringBuilder
            dup
            invokespecial java/lang/StringBuilder/<init>()V
            ldc "i = "
            invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            iload 0
            invokevirtual java/lang/StringBuilder/append(I)Ljava/lang/StringBuilder;
            invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;

            ; --------------
            invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

            ; i = i + 1
            iload 0
            ldc   1
            iadd
            istore 0

            ; compute i - 5
            iload 0
            ldc   5
            isub
            ifeq  end_for
            goto  begin_for 
    end_for:

            getstatic java/lang/System/out Ljava/io/PrintStream;
            ldc "All done"
            invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
            

    ; -----------------------------------

  return
.end method
