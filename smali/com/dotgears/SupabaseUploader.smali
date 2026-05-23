.class public Lcom/dotgears/SupabaseUploader;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final score:I
.field private final context:Landroid/content/Context;
.field private final displayName:Ljava/lang/String;

.method public constructor <init>(ILandroid/content/Context;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/dotgears/SupabaseUploader;->score:I
    iput-object p2, p0, Lcom/dotgears/SupabaseUploader;->context:Landroid/content/Context;
    iput-object p3, p0, Lcom/dotgears/SupabaseUploader;->displayName:Ljava/lang/String;
    return-void
.end method

.method private static md5hex(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    :try_start_md5
    const-string v0, "MD5"
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    move-result-object v0

    const-string v1, "UTF-8"
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B
    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0
    array-length v3, v0

    :hex_loop
    if-ge v2, v3, :hex_done

    aget-byte v4, v0, v2
    and-int/lit16 v4, v4, 0xff

    const/16 v5, 0x10
    if-ge v4, v5, :no_pad
    const-string v5, "0"
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :no_pad
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1
    goto :hex_loop

    :hex_done
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    return-object v1

    :try_end_md5
    .catch Ljava/lang/Exception; {:try_start_md5 .. :try_end_md5} :catch_md5

    :catch_md5
    const-string v1, ""
    return-object v1
.end method

.method public run()V
    .locals 5

    :try_start_0

    iget-object v0, p0, Lcom/dotgears/SupabaseUploader;->context:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0

    const-string v1, "android_id"
    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    invoke-static {v0}, Lcom/dotgears/SupabaseUploader;->md5hex(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0

    # POST - yeni skoru ekle
    new-instance v1, Ljava/net/URL;
    const-string v2, "https://vrllaicurphvrznsugfa.supabase.co/rest/v1/scores?on_conflict=user_id"
    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
    move-result-object v1
    check-cast v1, Ljava/net/HttpURLConnection;

    const-string v2, "POST"
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v2, "apikey"
    const-string v3, "sb_publishable_PwNiFx6VAZyUJ5J5UU7I8w_xhYIfA32"
    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Authorization"
    const-string v3, "Bearer sb_publishable_PwNiFx6VAZyUJ5J5UU7I8w_xhYIfA32"
    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Content-Type"
    const-string v3, "application/json"
    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "Prefer"
    const-string v3, "resolution=merge-duplicates"
    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{\"user_id\":\""
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, "\",\"display_name\":\""
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/dotgears/SupabaseUploader;->displayName:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, "\",\"score\":"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    iget v3, p0, Lcom/dotgears/SupabaseUploader;->score:I
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v3, "}"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v3
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B
    move-result-object v2
    invoke-virtual {v3, v2}, Ljava/io/OutputStream;->write([B)V
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
