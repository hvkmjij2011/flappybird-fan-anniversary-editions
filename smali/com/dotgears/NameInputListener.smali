.class public Lcom/dotgears/NameInputListener;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;

.field private context:Landroid/content/Context;
.field private editText:Landroid/widget/EditText;

.method public constructor <init>(Landroid/content/Context;Landroid/widget/EditText;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/dotgears/NameInputListener;->context:Landroid/content/Context;
    iput-object p2, p0, Lcom/dotgears/NameInputListener;->editText:Landroid/widget/EditText;
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5 # .locals sayısını 4'ten 5'e çıkar ki yeni register kullanabilelim

    iget-object v0, p0, Lcom/dotgears/NameInputListener;->context:Landroid/content/Context;
    const-string v1, "FlappyBird"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0

    # Skor değerini çekelim (supabese göndermek için lazım)
    const-string v3, "score"
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v3 # v3 register'ında artık güncel skor var

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0

    iget-object v1, p0, Lcom/dotgears/NameInputListener;->editText:Landroid/widget/EditText;
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "username"
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    # --- SUPABASE TETİKLEME KISMI ---
    # Yeni bir thread oluştur ve uploader'ı başlat
    iget-object v4, p0, Lcom/dotgears/NameInputListener;->context:Landroid/content/Context;
    new-instance v0, Ljava/lang/Thread;
    new-instance v2, Lcom/dotgears/SupabaseUploader;
    invoke-direct {v2, v3, v4, v1}, Lcom/dotgears/SupabaseUploader;-><init>(ILandroid/content/Context;Ljava/lang/String;)V
    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    # --------------------------------

    return-void
.end method
