import java.awt.TextField;
import java.awt.Rectangle;
import java.awt.Container;
import processing.awt.*;

Container ct = new Container();
Button but;
TextField input = new TextField("AA");

void setup() {
  size(400,200);
  textFont(createFont("Harrington", 16));
  ct.setLayout(null);
  input.setBounds(0,0,150,20);
  ct.add(input);
  but = new Button("save", 200, 50);
}

void mouseClicked(){ but.clicked(input.getText()); }

void draw() {
  background(255);
  but.draw();
  textAlign(LEFT);
  text("Input␣your␣name␣and␣click␣save␣button!!", 10, 30);
  if(but.getStatus()) text(but.getTextInput(), 10, 90);
}

//SwingInProcessing_Button_Listener

/*import processing.awt.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

void setup(){
  size(640, 480);
  Canvas canvas = (Canvas)surface.getNative();
    JLayeredPane layeredPane = (JLayeredPane)canvas.getParent().getParent();

  JTextField textField = new JTextField("New Text Field");
  textField.setBounds(10, 360, 620, 20);

  // Generate Object Instance of Inner Class for ActionListener
  // ActionListenerインタフェースを実装するインナークラス(後述)の
  // オブジェクトインスタンスの生成
  MyButtonListener myButtonListener = new MyButtonListener();

  // インナークラスに作ったTextField登録関数を使って，TextFieldを登録
  myButtonListener.setTextField(textField);

  // ボタンを作って，場所とサイズを決める
  JButton button1 = new JButton("Button 1");
  button1.setBounds(10, 390, 100, 20);

  // このボタンの「アクションコマンド」文字列を指定する．
  // ここでは"button1_push"という文字列を指定している
  button1.setActionCommand("button1_push");
  //ボタンを，ActionListenerを実装したクラスのオブジェクトに登録する
  button1.addActionListener(myButtonListener);

  // Paneにテキストフィールドとボタンを追加
  layeredPane.add(textField);
  layeredPane.add(button1);
}

void draw(){
  ellipse(0,0,100,100);
}

// Inner Class for ActionListener
// ActionListenerを使うためのインナークラス
class MyButtonListener implements ActionListener {

  // Pointer of textField added JLayeredPane
  // スケッチの大元のTextFieldへの参照ポインタ変数
  JTextField textField;

  // その参照をsetup関数から登録するための登録関数
  void setTextField(JTextField textField){
    this.textField = textField;
  }

  //ActionListenerを使うための関数actionPerformed関数のオーバーライド
  @Override
  public void actionPerformed(ActionEvent e){
   String actionCommand = e.getActionCommand();
   if(actionCommand.equals("button1_push")){
    textField.setText("Button1 has been pushed");
   }
  }

}*/
