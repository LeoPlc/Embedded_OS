    #include<iostream>
    #include<vector>
    #include<algorithm>

    using namespace std;

    int main(){
        vector<char> alphabet;

        for(char lettre = 'a'; lettre <= 'z'; ++ lettre){
            alphabet.push_back(lettre); // Ajoute la lettre spécifiée à la fin du vecteur alphabet
        }

        cout << "Ordre alphabétique : ";
        for(char lettre : alphabet){
            cout << lettre << " ";
        }
        cout << endl; 

        // Tri du vecteur dans l'ordre inverse

        reverse(alphabet.begin(), alphabet.end());

        cout << "Ordre inverse : ";
        for(char lettre : alphabet){
            cout << lettre << " ";
        }
        cout << endl; 

        return 0;

    }
    