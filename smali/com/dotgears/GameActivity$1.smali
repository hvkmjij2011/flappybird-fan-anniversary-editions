.class Lcom/dotgears/GameActivity$1;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field final synthetic a:Lcom/dotgears/GameActivity;

.method constructor <init>(Lcom/dotgears/GameActivity;)V
    .locals 0
    iput-object p1, p0, Lcom/dotgears/GameActivity$1;->a:Lcom/dotgears/GameActivity;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
    .locals 6
    iget-object v0, p0, Lcom/dotgears/GameActivity$1;->a:Lcom/dotgears/GameActivity;

    const-string v1, "FlappyBird"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1

    const-string v2, "username"
    const/4 v3, 0x0
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    const-string v3, "score"
    const/4 v4, 0x0
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v3

    if-eqz v2, :show_dialog
    invoke-virtual {v2}, Ljava/lang/String;->length()I
    move-result v4
    if-eqz v4, :show_dialog

    new-instance v4, Ljava/lang/Thread;
    new-instance v5, Lcom/dotgears/SupabaseUploader;
    invoke-direct {v5, v3, v0, v2}, Lcom/dotgears/SupabaseUploader;-><init>(ILandroid/content/Context;Ljava/lang/String;)V
    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    return-void

    :show_dialog
    new-instance v4, Landroid/widget/EditText;
    invoke-direct {v4, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/app/AlertDialog$Builder;
    invoke-direct {v5, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "enter your username"
    invoke-virtual {v5, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    invoke-virtual {v5, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    new-instance v1, Lcom/dotgears/NameInputListener;
    invoke-direct {v1, v0, v4}, Lcom/dotgears/NameInputListener;-><init>(Landroid/content/Context;Landroid/widget/EditText;)V

    const-string v2, "submit"
    invoke-virtual {v5, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    return-void
.end method
