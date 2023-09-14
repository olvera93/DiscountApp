package com.olvera.discountapp.views

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
import com.olvera.discountapp.components.Alert
import com.olvera.discountapp.components.MainButton
import com.olvera.discountapp.components.MainTextField
import com.olvera.discountapp.components.SpaceH
import com.olvera.discountapp.components.TwoCards
import kotlin.math.round

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
        var priceDiscount by remember { mutableStateOf(0.0) }
        var totalDiscount by remember { mutableStateOf(0.0) }
        var showAlert by remember { mutableStateOf(false) }

        TwoCards(
            title1 = "Total",
            number1 = totalDiscount,
            title2 = "Discount",
            number2 = priceDiscount
        )

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
            if (price != "" && discount != "") {
                priceDiscount = calculatePrice(price.toDouble(), discount.toDouble())
                totalDiscount = calculateDiscount(price.toDouble(), discount.toDouble())
            } else {
                showAlert = true
            }
        }

        SpaceH()
        MainButton(text = "Clean", color = Color.Red) {
            price = ""
            discount = ""
            priceDiscount = 0.0
            totalDiscount = 0.0
        }

        if (showAlert) {
            Alert(
                title = "Alert",
                message = "Type the price and discount",
                confirmText = "Accept",
                onConfirmClick = { showAlert = false }
            ) { }
        }
    }
}

fun calculatePrice(price: Double, discount: Double): Double {
    val res = price - calculateDiscount(price, discount)
    return round(res * 100) / 100.0
}

fun calculateDiscount(price: Double, discount: Double): Double {
    val res = price * (1 - discount / 100)
    return round(res * 100) / 100.0
}

