#include "BST.h"
#include<iostream>
using namespace std;

template<class T>
BST<T>::BST()
{
	root = nullptr;
}
template<class T>
void BST<T>::insert(T data)
{
	if (root != nullptr)
	{
		insert(root, data);
	}
	else
	{
		root = new Node<T>;
		root->Value = data;
		root->LeftChild = nullptr;
		root->RightChild = nullptr;
	}
}
template<class T>
bool BST<T>::Search(T data)
{
	
	bool isfound = Search(root, data);
	if (isfound)
	{
		return true;
	}

	else
	{
		return false;
	}
	return isfound;
}
template<class T>
void  BST<T>::inorderTraversal()const
{
	inorderTraversal(root);
}
template<class T>
void BST<T>::preOrderTraversal()const
{

	preOrderTraversal(root);
}
template<class T>
void BST<T>::PostOrderTraversal()const
{
	PostOrderTraversal(root);
}
template<class T>
void BST<T>::PrintTreeOrder()
{
	PrintTreeOrder(root);
}
template<class T>
T BST<T>::Count_LeafNodes()const
{
  return Count_LeafNodes(root);
}
template<class T>
BST<T>::~BST()
{
	delete root;
}