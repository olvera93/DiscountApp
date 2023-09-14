package com.olvera.discountapp.views

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.olvera.discountapp.components.MainButton
import com.olvera.discountapp.components.MainTextField
import com.olvera.discountapp.components.SpaceH

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeView() {

    Scaffold(topBar = {
        CenterAlignedTopAppBar(
            title = { Text(text = "Discount App", color = Color.White) },
            colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
                containerColor = MaterialTheme.colorScheme.primary
            )
        )
    }) {
        ContentHomeView(it)
    }
}


@Composable
fun ContentHomeView(paddingValues: PaddingValues) {

    Column(
        modifier = Modifier
            .padding(paddingValues)
            .padding(10.dp)
            .fillMaxSize(),
        //verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {

        var price by remember { mutableStateOf("") }
        var discount by remember { mutableStateOf("") }

        MainTextField(
            value = price,
            onValueChange = { price = it },
            label = "Price"
        )

        SpaceH()

        MainTextField(
            value = discount,
            onValueChange = { discount = it },
            label = "Discount"
        )

        SpaceH(10.dp)

        MainButton(text = "Discount generator") {

        }

        SpaceH()
        MainButton(text = "Clear", color = Color.Red) {

        }

    }

}