struct App {
    char key;
    char app[50];
    char icon[7];
};

char gkey();
int key_apps(char key, struct App apps[], int n);
