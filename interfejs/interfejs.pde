PImage img_menu;
Boolean menuVisible = false;
int currentFilter;
MenuItem[] menuList;

void setup() {
    size(800,600);
    img_menu = loadImage("menu3.png");
    menuVisible = false;
    menuList = new MenuItem[3];
    menuList[0] = new MenuItem(1, "imageRotate");
    menuList[1] = new MenuItem(2, "imageFlipped");
    menuList[2] = new MenuItem(3, "imageColor");
}

void draw() {
    background(255);
    image(img_menu, width - 100, 20);
    if(menuVisible) {
        for(int i = 0; i < menuList.length; i++) {
            menuList[i].show();
        }
    }
}

void toggleMenu() {
    if(menuVisible) menuVisible = false;
    else menuVisible = true;
}

void mousePressed() {
    if( mouseX < width - 20
        && mouseX > width - 100
        && mouseY < 90
        && mouseY > 20 ) {
            toggleMenu();
    }
    // 1
    if( menuVisible
        && mouseX < width - 20
        && mouseX > width - 320
        && mouseY < 166
        && mouseY >= 93 ) {
            for(int i = 0; i < menuList.length; i++)
                menuList[i].setCurrent(false);
            menuList[0].setCurrent(true);
            currentFilter = 1;
            menuVisible = false;
    }
    // 2
    if( menuVisible
        && mouseX < width - 20
        && mouseX > width - 320
        && mouseY < 239
        && mouseY >= 166 ) {
            for(int i = 0; i < menuList.length; i++)
                menuList[i].setCurrent(false);
            menuList[1].setCurrent(true);
            currentFilter = 2;
            menuVisible = false;
    }
    // 3
    if( menuVisible
        && mouseX < width - 20
        && mouseX > width - 320
        && mouseY < 312
        && mouseY >= 239 ) {
            for(int i = 0; i < menuList.length; i++)
                menuList[i].setCurrent(false);
            menuList[2].setCurrent(true);
            currentFilter = 3;
            menuVisible = false;
    }

}
