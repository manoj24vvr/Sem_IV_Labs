#include <iostream>
using namespace std;

class node{
    public:
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

int maxDepth(node* node){
    if (node == NULL)
            return -1;
    else{
            int lDepth = maxDepth(node->left);
            int rDepth = maxDepth(node->right);

            if (lDepth > rDepth)
                    return (lDepth + 1);
            else
                    return (rDepth + 1);
    }
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


int main()
{
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

    cout << "Height of tree is: " << maxDepth(root) << "\n";
    return 0;
}




----------------------------------


#include <iostream>
using namespace std;

int FindHeight(int i, int binTree[]){
        int lHeight = 0, rHeight = 0, Height = 0;
        if (binTree[i] == -1){
                Height= -1;
        }else{
                lHeight= FindHeight(2*i+1, binTree);
                rHeight = FindHeight(2*i+2, binTree);
                if (binTree[2*i+1] == 0 && binTree[2*i+2] == 0){
                        Height= -1;
                } else{
                        Height= lHeight> rHeight ? (lHeight+1): (rHeight+1);
                }
        }
        return Height;
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
        cout<<"Enter next element: "<<endl;
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
        cout<< endl<<"Height is  " << FindHeight(0, binTree)<<endl;
        return 0;

_______________________________________________________________________________


#include <iostream>

class node
{
        public:
                int data;
                node* left;
                node* right;
};

int maxDepth(node* node)
{
        if (node == NULL)
                return -1;
        else
        {
                int lDepth = maxDepth(node->left);
                int rDepth = maxDepth(node->right);

                if (lDepth > rDepth)
                        return (lDepth + 1);
                else
                        return (rDepth + 1);
        }
}

node* new_node(int data)
{
        node* Node = new node();
        Node->data = data;
        Node->left = NULL;
        Node->right = NULL;
        return Node;
}

int main()
{
        node *root = new_node(1);
        root->left = new_node(2);
        root->right = new_node(3);
        root->left->right = new_node(4);
        root->left->right->left = new_node(10);

        std::cout << "Height of tree is: " << maxDepth(root) << "\n";
        return 0;
}