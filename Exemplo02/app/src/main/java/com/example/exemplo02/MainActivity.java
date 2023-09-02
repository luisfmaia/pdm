package com.example.exemplo02;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class MainActivity extends AppCompatActivity {

    private Context context;
    private File internal;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        context = getApplicationContext();

        setContentView(R.layout.activity_main);

    }

    public void salvar(View view){
        EditText editTextName = (EditText) findViewById(R.id.editTextName);
        EditText editTextValue = (EditText) findViewById(R.id.editTextValue);
        EditText editTextResult = (EditText) findViewById(R.id.editTextResult);

        String name = editTextName.getText().toString();
        String value = editTextValue.getText().toString();

        if (name.equals("")) {
            Toast.makeText(context, "Digite um nome", Toast.LENGTH_SHORT).show();
            return;
        }

        if (value.equals("")) {
            Toast.makeText(context, "Digite um valor", Toast.LENGTH_SHORT).show();
            return;
        }

        /* Escrita arquivo */
        createFile(name, value);
        editTextResult.setText(listFiles());

        ///* Permissão de armazenamento externo */
        //StringBuffer result = new StringBuffer();
        //if (isExternalStorageReadable()) {
        //    result.append("Permissão de leitura OK\n");
        //} else {
        //    result.append("Sem permissão de leitura\n");
        //}
        //
        //if (isExternalStorageWritable()) {
        //    result.append("Permissão de escrita OK\n");
        //} else {
        //    result.append("Sem permissão de escrita\n");
        //}
        //editTextResult.setText(result.toString());

        ///* Escrita de arquivo compartilhado */
        //createSharedFile();

        /* Escrita SharedPreferences */
        writeSharedPrefs(name,value);
        editTextResult.setText("Salvou: "+name);

    }

    public void carregar(View view){
        EditText editTextName = (EditText) findViewById(R.id.editTextName);
        EditText editTextResult = (EditText) findViewById(R.id.editTextResult);

        String name = editTextName.getText().toString();

        if (name.equals("")) {
            Toast.makeText(context, "Digite um nome", Toast.LENGTH_SHORT).show();
            return;
        }

        /* Leitura arquivo */
        editTextResult.setText(readFile(name));

        ///* Leitura de arquivo compartilhado */
        //openSharedFile();

        ///* Leitura SharedPreferences */
        //editTextResult.setText(readSharedPrefs(name));
    }

    private void createFile(String filename, String content) {
        //File cache = new File(context.getCacheDir(), filename);
        //File internal = new File(context.getFilesDir(), filename);
        //File external = new File(context.getExternalFilesDir(Environment.DIRECTORY_DOCUMENTS), filename);

        File file = new File(context.getFilesDir(), filename);

        Log.e("TESTE", "Salvando arquivo...");
        try (FileOutputStream fos = context.openFileOutput(filename, Context.MODE_PRIVATE)) {
            fos.write(content.getBytes());
        } catch (Exception e) {
            Log.e("TESTE", "Erro fos");
        }

    }

    private String listFiles() {
        String[] files = this.context.fileList();

        for (String f : files) {
            Log.e("TESTE", f);
        }
        return String.join("\n", files);
    }

    private String readFile(String filename) {
        FileInputStream fis = null;
        String content = null;
        try {
            fis = context.openFileInput(filename);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        InputStreamReader inputStreamReader =
                new InputStreamReader(fis, StandardCharsets.UTF_8);
        StringBuilder stringBuilder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(inputStreamReader)) {
            String line = reader.readLine();
            while (line != null) {
                stringBuilder.append(line).append('\n');
                line = reader.readLine();
            }
        } catch (IOException e) {
            return null;
        } finally {
            content = stringBuilder.toString();
        }
        return content;
    }

    private boolean isExternalStorageWritable() {
        return Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED);
    }

    private boolean isExternalStorageReadable() {
        return Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED) ||
                Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED_READ_ONLY);
    }

    private void createSharedFile() {
        final int CREATE_FILE = 1;

        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/pdf");
        intent.putExtra(Intent.EXTRA_TITLE, "Aula02.pdf");

        startActivityForResult(intent, CREATE_FILE);
    }

    private void openSharedFile() {
        final int PICK_PDF_FILE = 2;

        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/pdf");

        startActivityForResult(intent, PICK_PDF_FILE);
    }

    private void writeSharedPrefs(String key, String value) {
        SharedPreferences sharedPref = getApplicationContext().getSharedPreferences("CONFIGS", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString(key, value);
        editor.apply();
    }

    private String readSharedPrefs(String key) {
        SharedPreferences sharedPref = getApplicationContext().getSharedPreferences("CONFIGS", Context.MODE_PRIVATE);
        String value = sharedPref.getString(key, "valor padrão");
        return value;
    }

}