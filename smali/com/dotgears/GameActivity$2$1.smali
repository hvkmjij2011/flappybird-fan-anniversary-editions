.class Lcom/dotgears/GameActivity$2$1;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field final synthetic a:Lcom/dotgears/GameActivity$2;
.field final synthetic b:Lcom/dotgears/GameActivity;
.field final synthetic c:Ljava/lang/String;

.method constructor <init>(Lcom/dotgears/GameActivity$2;Lcom/dotgears/GameActivity;Ljava/lang/String;)V
    .locals 0
    iput-object p1, p0, Lcom/dotgears/GameActivity$2$1;->a:Lcom/dotgears/GameActivity$2;
    iput-object p2, p0, Lcom/dotgears/GameActivity$2$1;->b:Lcom/dotgears/GameActivity;
    iput-object p3, p0, Lcom/dotgears/GameActivity$2$1;->c:Ljava/lang/String;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/dotgears/GameActivity$2$1;->b:Lcom/dotgears/GameActivity;
    iget-object v2, p0, Lcom/dotgears/GameActivity$2$1;->c:Ljava/lang/String;

    new-instance v1, Landroid/app/AlertDialog$Builder;
    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "leaderboard"
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v0, "close"
    const/4 v2, 0x0
    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method
