import processing.awt.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
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

}
