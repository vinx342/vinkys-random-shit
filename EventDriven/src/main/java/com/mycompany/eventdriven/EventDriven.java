package com.mycompany.eventdriven;

import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class EventDriven extends JFrame {

    JFrame otFrame = new JFrame();
    JLabel FN_LBL = new JLabel("First Name: ");
    JLabel LN_LBL = new JLabel("Last Name: ");
    JLabel MN_LBL = new JLabel("Middle Name: ");
    JLabel MPN_LBL = new JLabel("Mobile Number: ");
    JLabel EML_LBL = new JLabel("Email Address: ");
    Font lblFont = new Font("Arial", Font.BOLD, 12);
    JButton BTN_SUBMIT = new JButton("Submit");
    JButton BTN_CLEARALL = new JButton("Clear All");
    JButton BTN_OKAY = new JButton("Okay");
    static JTextField FN = new JTextField(15);
    static JTextField LN = new JTextField(15);
    static JTextField MN = new JTextField(15);
    static JTextField MPN = new JTextField(15);
    static JTextField EML = new JTextField(15);
    JTextArea OPT_AREA = new JTextArea(10, 26);

    public EventDriven() {
        super("INPUT");
        setSize(235, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new FlowLayout());
        setResizable(false);
        setLocationRelativeTo(null);
        Input();
        
    }

    public void Input() {
        FN_LBL.setFont(lblFont);
        LN_LBL.setFont(lblFont);
        MN_LBL.setFont(lblFont);
        MPN_LBL.setFont(lblFont);
        EML_LBL.setFont(lblFont);
        MN.setText("");
        add(FN_LBL);
        add(FN);
        add(LN_LBL);
        add(LN);
        add(MN_LBL);
        add(MN);
        add(MPN_LBL);
        add(MPN);
        add(EML_LBL);
        add(EML);
        add(BTN_SUBMIT);
        add(BTN_CLEARALL);
        setVisible(true);
        BTN_SUBMIT.addActionListener(new btnSubmit());
        BTN_CLEARALL.addActionListener(new btnClearAll());
    }

    public void Output() {
        otFrame.setTitle("OUTPUT");
        otFrame.setSize(325, 240);
        otFrame.setLayout(new FlowLayout());
        otFrame.setResizable(false);
        otFrame.setLocationRelativeTo(null);
        otFrame.add(OPT_AREA);
        otFrame.add(BTN_OKAY);
        otFrame.setVisible(true);
        OPT_AREA.setEditable(false);
        OPT_AREA.setFocusable(false);
        BTN_OKAY.addActionListener(new btnOkay());
        OPT_AREA.setText(null);
        OPT_AREA.append("\nFirst Name:\t" + FN.getText());
        OPT_AREA.append("\nLast Name:\t" + LN.getText());
        OPT_AREA.append("\nMiddle Name:\t" + MN.getText());
        OPT_AREA.append("\nMobile No.:\t" + MPN.getText());
        OPT_AREA.append("\nEmail Add:\t" + EML.getText());
        BTN_SUBMIT.setEnabled(false);
        BTN_OKAY.addActionListener(new btnOkay());

        otFrame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                BTN_SUBMIT.setEnabled(true);
            }
        });
    }

    public class btnSubmit implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            // Catches any invalid input of the user
            try {
                emptyTField(FN.getText());
                emptyTField(LN.getText());
                emptyTField(MPN.getText());
                emptyTField(EML.getText());
                long MOBILE_NUM = Long.parseLong(MPN.getText());
                Output();
            }   
                catch (EmptyTFieldException ETF) {
                    JOptionPane.showMessageDialog(null, ETF.getMessage(), "Missing Component", JOptionPane.QUESTION_MESSAGE);
                    return;
                } catch (NumberFormatException NFE) {
                    JOptionPane.showMessageDialog(null, "Input your mobile number correctly", "ERROR", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    public class btnClearAll implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            clearTextArea();
        }
    }

    public class btnOkay implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            otFrame.dispose();
            BTN_SUBMIT.setEnabled(true);
            clearTextArea();
        }
    }
    //Clears the text area/Refresh the frame
    public void clearTextArea()
    {
        FN.setText(null);
        LN.setText(null);
        MN.setText(null);
        MPN.setText(null);
        EML.setText(null);
    }
    
    public static class EmptyTFieldException extends Exception {
        public EmptyTFieldException(String ETF) {
            super(ETF);
        }
    }
    static void emptyTField(String ETF) throws EmptyTFieldException {
        if (FN.getText().isEmpty()) {
            throw new EmptyTFieldException("First Name is missing");
        } else if (LN.getText().isEmpty()) {
            throw new EmptyTFieldException("Last Name is missing");
        } else if(MPN.getText().isEmpty()) {
            throw new EmptyTFieldException("Mobile number is missing");
        } else if (EML.getText().isEmpty()) {
            throw new EmptyTFieldException("Email is missing");
        }
    }

    public static void main(String[] args) {
        new EventDriven();
    }
}