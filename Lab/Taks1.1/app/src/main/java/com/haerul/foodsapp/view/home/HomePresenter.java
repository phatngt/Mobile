/*-----------------------------------------------------------------------------
 - Developed by Haerul Muttaqin                                               -
 - Last modified 3/17/19 5:24 AM                                              -
 - Subscribe : https://www.youtube.com/haerulmuttaqin                         -
 - Copyright (c) 2019. All rights reserved                                    -
 -----------------------------------------------------------------------------*/
package com.haerul.foodsapp.view.home;

import com.haerul.foodsapp.Utils;
import com.haerul.foodsapp.model.Categories;
import com.haerul.foodsapp.model.Meals;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

class HomePresenter {

    private HomeView view;

    public HomePresenter(HomeView view) {
        this.view = view;
    }


    void getMeals() {
        // do loading before making a request to the server
        view.showLoading();
        // with the line you have made a request
        Call<Meals> mealsCall = Utils.getApi().getMeal();

        // waiting for Callback
        mealsCall.enqueue(new Callback<Meals>() {
            @Override
            public void onResponse(Call<Meals> call, Response<Meals> response) {
                //  Close loading when you have received a response from the server
                view.hideLoading();
                // Non-empty results check & Non-empty results check
                if (response.isSuccessful() && response.body() != null) {
                    /*
                     * Receive the result
                     * input the results obtained into the setMeals() behavior
                     * and enter response.body() to the parameter
                     */
                    view.setMeals(response.body().getMeals());


                }
                else {
                    //Show an error message if the conditions are not met
                    view.onErrorLoading(response.message());

                }
            }

            @Override
            public void onFailure(Call<Meals> call, Throwable t) {
                /*
                 * Failure will be thrown here
                 * for this you must do
                 * 1. closes loading
                 * 2. displays an error message
                 */
                // Close loading
                view.hideLoading();
                // Show an error message
                view.onErrorLoading(t.getLocalizedMessage());

            }
        });
    }


    void getCategories() {
        // do loading before making a request to the server
        view.showLoading();
        // create Call<Categories> categoriesCall = ...
        Call<Categories> categoriesCall =  Utils.getApi().getCategories();

        // waiting for enqueue Callback
        categoriesCall.enqueue(new Callback<Categories>() {
            @Override
            public void onResponse(Call<Categories> call, Response<Categories> response) {
                // Non-empty results check & Non-empty results check
                view.hideLoading();
                if (response.isSuccessful() && response.body() != null) {
                    /*
                     * Receive the result
                     * input the results obtained into the setMeals() behavior
                     * and enter response.body() to the parameter
                     */
                    view.setCategory(response.body().getCategories());


                }
                else {
                    // Show an error message if the conditions are not met
                    view.onErrorLoading(response.message());

                }
            }

            @Override
            public void onFailure(Call<Categories> call, Throwable t) {
                /*
                 * Failure will be thrown here
                 * for this you must do
                 * 1. closes loading
                 * 2. displays an error message
                 */

                // Close loading
                view.hideLoading();
                // Show an error message
                view.onErrorLoading(t.getLocalizedMessage());
            }
        });
    }
}
