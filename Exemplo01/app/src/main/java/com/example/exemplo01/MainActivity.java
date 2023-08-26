package com.example.exemplo01;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Log.d("Exemplo01","Activity1-onCreate");

        setContentView(R.layout.activity_main);
    }


    public void clickButton1(View v){
        Log.d("Exemplo01","Activity1-Clicou botão proximo");

        EditText editText=(EditText) findViewById(R.id.editText1);

        Intent intent=new Intent(this,SecondActivity.class);
        intent.putExtra("parametro1", editText.getText().toString());
        startActivity(intent);
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d("Exemplo01","Activity1-onStop");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d("Exemplo01","Activity1-onPause");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("Exemplo01","Activity1-onResume");
    }
}