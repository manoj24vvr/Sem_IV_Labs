#include <iostream>
using namespace std;

struct node{
        int data;
        node* left;
        node* right;
};

node* insert(node* root, int ele) {
        node* temp = new node;
        temp -> data = ele;
        temp -> left = temp -> right = NULL;
        root = temp;
        return root;
}

node* insert_into_bst(node* root, int ele) {
        if(root == NULL)
                root = insert(root, ele);
        else if(ele < root -> data)
                root -> left = insert_into_bst(root -> left, ele);
        else
                root -> right = insert_into_bst(root -> right, ele);
        return root;
}

void preorder(node* root) {
        if(root == NULL)
                return;
        preorder(root -> left);
        cout << root -> data << " ";
        preorder(root -> right);
}

void inorder(node* root) {
        if(root == NULL)
                return;
        cout << root -> data << " ";
        inorder(root -> left);
        inorder(root -> right);
}

void postorder(node* root) {
        if(root == NULL)
                return;
        postorder(root -> left);
        postorder(root -> right);
        cout << root -> data << " ";
}

int main() {
        node* root = NULL;
        int n;
        cout << "Enter the number of nodes: ";
        cin >> n;
        for(int i = 0; i < n; i++) {
                int ele;
                cout << "Enter element " << i+1 << ": ";
                cin >> ele;
                root = insert_into_bst(root, ele);
        }
        cout << "Preorder Traversal: ";
        preorder(root);
        cout << endl << "Inorder Traversal: ";
        inorder(root);
        cout << endl << "Postorder Traversal: ";
        postorder(root);
        cout << endl;
    return 0;
}

_________________________________

#include <iostream>
using namespace std;

void inOrder(int i, int binTree[]){
        if (binTree[i]!=-1){
                inOrder (2*i+1, binTree);
                cout << " " <<binTree[i]<<" ";
                inOrder (2*i+2, binTree);
        }
}
void preOrder(int i, int binTree[]){
        if (binTree[i]!=-1){
                cout << " " <<binTree[i]<<" ";
                preOrder (2*i+1, binTree);
                preOrder (2*i+2, binTree);
        }
}

void postOrder(int i, int binTree[]){
        if (binTree[i]!=-1){
                postOrder (2*i+1, binTree);
                postOrder (2*i+2, binTree);
                cout << " " <<binTree[i]<<" ";
        }
}
void insertChild(int child, int i, int binTree[]){
                if(binTree[i] == -1){
                                        binTree[i] = child;
                                                        binTree [2*i+1] = binTree [2*i+2] = -1;
                                                                }else if (child < binTree[i]){
                                                                                        insertChild (child, 2*i+1, binTree);
                                                                                                }else{

  insertChild (child, 2*i+2, binTree);

          }
}

void getChildren(int i, int binTree[]){
                int child;
                        cout<<"Next ele please"<<endl;
                                cin>>child;
                                        insertChild(child,i,binTree);
}

void createTree(int binTree[]){
                int num;
                        cout<< "Get number of elements"<<endl;
                                cin>> num;
                                        cout<<"Get root element"<<endl;
                                                cin>> binTree[0];
                                                        binTree[1] = binTree [2] =-1;
                                                                for (int i = 0; i<num-1; i ++){
                                                                                        getChildren(0,binTree);
                                                                                                }
}

int main(){
        int binTree[50];
        createTree(binTree);
        cout<<endl<<"Inorder traversal of BST-"<<endl;
        inOrder(0, binTree);
        cout<<endl<<"Preorder traversal of BST-"<<endl;
        preOrder(0, binTree);
        cout<<endl<<"Postorder traversal of BST-"<<endl;
        postOrder(0, binTree);
                return 0;
}
