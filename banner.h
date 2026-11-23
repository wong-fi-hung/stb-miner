void print_banner() {
    char teks[] = "          stb-miner";
    char perintah[256];
    snprintf(perintah, sizeof(perintah), "toilet -f smblock \"%s\"", teks) && system("echo '[01;33m'");
    system(perintah);
}
