#include<iostream>

using namespace std;
#include"BST.cpp"
int main()
{
	BST<int>bst;
	bst.insert(1);
	bst.insert(20);
	bst.insert(30);
	bst.insert(40);
	bst.insert(55);
	bst.insert(56);
	bst.insert(76);
	cout << endl;
	bst.PrintTreeOrder();
	cout << endl;
	bool found = bst.Search(4);
	cout << endl;
	if (found == false)
	{
		cout << "Not found" << endl;
	}

	else if (found == true)
	{
		cout << "Found" << endl;
	}
	cout << " Number of Leaf Nodes in BST Are:" << bst.Count_LeafNodes() << " ";
	bst.PrintTreeOrder();
	return 0;
}