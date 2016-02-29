/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import com.sk.client.CollectionClient;
import com.sk.client.CommentsClient;

import com.sk.client.FoodIngredientsClient;
import com.sk.client.RecipesClient;

import com.sk.client.UserClient;
import com.sk.entities.Comments;
import com.sk.entities.Users;
import com.sk.model.User;
import com.sk.webhandle.RecipeCollection;
import com.sk.webhandle.RecipeManager;
import com.sk.webhandle.SearchManager;
import com.sk.webhandle.UserManagement;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.ArrayList;
import java.util.Arrays;

import java.util.List;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author ray
 */
public class RecipeTest {

    public RecipeTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    @Test
    public void testAllRecipesCanBeGet() {
        RecipeManager rm = new RecipeManager();
        rm.getAllRecipe();
    }

    @Test
    public void deletRecipeByID() {
        RecipeManager rm = new RecipeManager();
        rm.deleteARecipe("26");
    }

    @Test
    public void testFindUserByName() {
        UserClient client = new UserClient();
        GenericType<Users> genType = new GenericType<Users>() {
        };
        Response res = client.findByName_JSON(Response.class, "se");
        System.out.println(res.toString());
        Users data = res.readEntity(genType);
        System.out.println(data.getUserGender());
        System.out.println(data.getUserName());

        client.close();
    }

    @Test
    public void testFindUserByEmail() {
        UserClient client = new UserClient();
        GenericType<Users> genType = new GenericType<Users>() {
        };
        Response res = client.findByEmail_JSON(Response.class, "se@qq.com");
        System.out.println(res.toString());

        Users data = res.readEntity(genType);
        System.out.println(data.getUserGender());
        System.out.println(data.getUserName());

        client.close();
    }

    @Test
    public void testUserMan() {
        UserManagement um = new UserManagement();
        User user = new User();
        user.setEmail("se@qq.com");
        user.setNickName("sea");

        System.out.println(um.emailExist(user));
        System.out.println(um.nameExist(user));
    }

    @Test
    public void testGetCollectionByUSerID() {
        RecipeCollection rc = new RecipeCollection();
        System.out.println("How Many in Collection?" + rc.getRecipesFromDB("9").size());

    }

    @Test
    public void testRecipeUser() {
        RecipeCollection rc = new RecipeCollection();
        System.out.println("Has? " + rc.inCollection("87", "19"));

    }

    @Test
    public void testCountRecipesByUserID() {
        CollectionClient client = new CollectionClient();
        String res = client.countRecipe("9");
        System.out.println(res);
        client.close();
    }

    @Test
    public void testCountRecipesByAuthorID() {
        RecipesClient rc = new RecipesClient();
        String res = rc.countRecipe("9");
        System.out.println(res);
        rc.close();

    }

    @Test
    public void testCOmments() {
        CommentsClient cClient = new CommentsClient();
        Response res = cClient.findByRecipeID(Response.class, "73");
        System.out.println(res.toString());
        GenericType<List<Comments>> genType = new GenericType<List<Comments>>() {
        };
        List<Comments> cL = res.readEntity(genType);
        for (Comments c : cL) {
            System.out.println(c.getCommentDatetime());
            System.out.println(c.getCommentContent());
        }

    }

    @Test
    public void testGetAllFoodItemsInDB() {
        RecipesClient rc = new RecipesClient();
        Response res = rc.getAllFoodNames(Response.class);
        String result = res.readEntity(String.class);

        result = result.substring(1, result.length() - 1);
        String[] resultArray = result.split(",");
        ArrayList<String> nameList = new ArrayList<>();
        for (String item : resultArray) {
            nameList.add(item.trim());
        }

        System.out.println(nameList.get(3));
    }

    @Test
    public void testGetAllTagsInDB() {
        RecipesClient rc = new RecipesClient();
        Response res = rc.getAllTags(Response.class);
        String result = res.readEntity(String.class);
        System.out.println(result.toString());
        ArrayList<String> resultList = new ArrayList<>();

        result = result.substring(1, result.length() - 1).toLowerCase();
        char[] charList = result.toCharArray();
        StringBuilder sb = new StringBuilder();

        Boolean flag = false;
        for (int i = 0; i < result.length(); i++) {
            System.out.println(charList[i]);
            if (charList[i] == '#') {
                sb = new StringBuilder();
                flag = true;
                continue;
            }
            if (charList[i] < 'a' || charList[i] > 'z') {
                if (flag) {
                    resultList.add(sb.toString());

                    flag = false;
                }
            }
            if (flag) {
                sb.append(charList[i]);
            }

        }

    }

    @Test
    public void testGetTagList() {
        SearchManager sm = new SearchManager();
        for (String st : sm.getTagsList()) {
            System.out.println(st);
        }
    }

    @Test
    public void testArrayListContainsSameItem() {
        ArrayList<String> x = new ArrayList<>();
        x.add("a");
        x.add("a");
        x.add("a");
        System.out.println(x.size());
        HashMap<String, Integer> hm = new HashMap<>();
        for (String y : x) {
            if (hm.containsKey(y)) {
                int count = hm.get(y);
                hm.put(y, ++count);
            } else {
                hm.put(y, 1);
            }
        }
        System.out.println(hm.get("a") + " : " + hm.keySet().toString());

    }

    @Test
    public void testIngreiListingByName() {
        FoodIngredientsClient fiClient = new FoodIngredientsClient();
        try {
            Response res = fiClient.getRecipeIdByFoodName(Response.class, "Beef");
            System.out.println(res.readEntity(String.class));
            String result= res.readEntity(String.class);
            String[] resultlist = result.substring(1,result.length()-1).split(",");
            
            
            
        } catch (Exception e) {
            System.out.println("Error: " + e);
        } finally {
            fiClient.close();
        };
    }
    
    @Test
    public void testIngreiListingByTag() {
        RecipesClient rClient = new RecipesClient();
        try {
            Response res = rClient.getRecipesByTag(Response.class, "Chinese");
            String result= res.readEntity(String.class);
            String[] resultlist = result.substring(1,result.length()-1).split(",");
            System.out.println(resultlist);
            
            
        } catch (Exception e) {
            System.out.println("Error: " + e);
        } finally {
            rClient.close();
        };
        
    }

    @Test
    public void testGetAllRecipeID() {
        RecipesClient rc = new RecipesClient();
        String st = rc.findAllRecipeID().trim();
        String[] sp = rc.findAllRecipeID().substring(1, st.length()-1).trim().split(",");
        ArrayList<String> IDList = new ArrayList<String>(Arrays.asList(sp));
     
        System.out.println(st);
        System.out.println(IDList.get(3));
        rc.close();
    }

}

