.class Lcom/dotgears/GameActivity$2;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field final synthetic a:Lcom/dotgears/GameActivity;

.method constructor <init>(Lcom/dotgears/GameActivity;)V
    .locals 0
    iput-object p1, p0, Lcom/dotgears/GameActivity$2;->a:Lcom/dotgears/GameActivity;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
    .locals 8

    :try_start_0

    # GET isteği
    new-instance v0, Ljava/net/URL;
    const-string v1, "https://vrllaicurphvrznsugfa.supabase.co/rest/v1/scores?select=display_name,score&order=score.desc&limit=10"
    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
    move-result-object v0
    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v1, "apikey"
    const-string v2, "sb_publishable_PwNiFx6VAZyUJ5J5UU7I8w_xhYIfA32"
    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Authorization"
    const-string v2, "Bearer sb_publishable_PwNiFx6VAZyUJ5J5UU7I8w_xhYIfA32"
    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Accept"
    const-string v2, "application/json"
    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    move-result-object v1

    new-instance v2, Ljava/io/BufferedReader;
    new-instance v3, Ljava/io/InputStreamReader;
    const-string v4, "UTF-8"
    invoke-direct {v3, v1, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :read_loop
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v4
    if-eqz v4, :read_done
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :read_loop

    :read_done
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    :parse_loop
    const-string v6, "display_name\":\""
    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v6
    if-ltz v6, :parse_done

    const/16 v7, 0xf
    add-int/2addr v6, v7

    const-string v7, "\""
    invoke-virtual {v3, v7, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v7
    if-ltz v7, :parse_done

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6

    move v5, v7

    const-string v7, "\"score\":"
    invoke-virtual {v3, v7, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v7
    if-ltz v7, :parse_done

    add-int/lit8 v7, v7, 0x8

    move v5, v7
    :score_scan
    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C
    move-result v0
    const/16 v1, 0x2c
    if-eq v0, v1, :score_end
    const/16 v1, 0x7d
    if-eq v0, v1, :score_end
    const/16 v1, 0x5d
    if-eq v0, v1, :score_end
    add-int/lit8 v5, v5, 0x1
    invoke-virtual {v3}, Ljava/lang/String;->length()I
    move-result v0
    if-lt v5, v0, :score_scan

    :score_end
    invoke-virtual {v3, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v7

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v0, " - "
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v0, "\n"
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :parse_loop

    :parse_done
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4

    if-nez v4, :has_content
    const-string v4, "Henüz skor yok."

    :has_content
    iget-object v0, p0, Lcom/dotgears/GameActivity$2;->a:Lcom/dotgears/GameActivity;
    new-instance v1, Lcom/dotgears/GameActivity$2$1;
    invoke-direct {v1, p0, v0, v4}, Lcom/dotgears/GameActivity$2$1;-><init>(Lcom/dotgears/GameActivity$2;Lcom/dotgears/GameActivity;Ljava/lang/String;)V
    invoke-virtual {v0, v1}, Lcom/dotgears/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
