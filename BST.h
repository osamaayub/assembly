#pragma once
#include"Node.h"
#include<iostream>
using namespace std;
template<class T>
class BST
{
private:
	Node<T>*root;
	void insert(Node<T>*node, T d)
	{

		// element to be inserted is lesser than node’s data
		if (d < node->Value)
		{
			// if left subtree is present
			if (node->LeftChild != NULL)
				insert(node->LeftChild, d);

			// create new node
			else
			{
				node->LeftChild = new Node<T>;
				node->LeftChild->Value = d;
				node->LeftChild->LeftChild = NULL;
				node->LeftChild->RightChild = NULL;
			}
		}

		// element to be inserted is greater than node’s data
		else if (d >= node->Value)
		{
			// if left subtree is present
			if (node->RightChild != NULL)
				insert(node->RightChild, d);

			// create new node
			else
			{
				node->RightChild = new Node<T>;
				node->RightChild->Value = d;
				node->RightChild->LeftChild = NULL;
				node->RightChild->RightChild = NULL;
			}
		}
	}
	void inorderTraversal(Node<T>* temp)
	{
		if (temp != nullptr)
		{
			inorderTraversal(temp->LeftChild);//L
			cout << temp->Value << " " << endl;
			inorderTraversal(temp->RightChild);//R
		}
	}
	void  preOrderTraversal(Node<T>*temp)
	{
		if (temp != nullptr)
		{
			cout << temp->Value << " " << endl;
			preOrderTraversal(temp->LeftChild); // L
			preOrderTraversal(temp->RightChild);//R
		}
	}
	void PostOrderTraversal(Node<T>*temp)
	{
		if (temp != nullptr)
		{
			PostOrderTraversal(temp->LeftChild);//L
			PostOrderTraversal(temp->RightChild);//R
			cout << temp->Value << "  " << endl;
		}
	}
	void PrintTreeOrder(Node<T>*temp)
	{
		if (temp == nullptr)
			return;
		PrintTreeOrder(temp->LeftChild);
		cout << temp->Value << " " << endl;
		PrintTreeOrder(temp->RightChild);
	}
	Node<T>*Search(Node<T>*temp, int val)
	{
		if (temp == nullptr)
			return nullptr;
		else if (temp->Value == val)
		{
			return temp;
		}
		else if (temp->Value < val)
			return Search(temp->RightChild, val);
		else
			return Search(temp->LeftChild, val);
	}
	T Count_LeafNodes(Node<T>*temp)
	{
		if (temp == nullptr)
			return 0;
		if (temp->LeftChild == nullptr &&temp->RightChild == nullptr)
			return 1;
		else
			return Count_LeafNodes(temp->LeftChild) + Count_LeafNodes(temp->RightChild);
	}
public:
	BST();
	void insert(T data);
	void inorderTraversal()const;
	void preOrderTraversal()const;
	bool Search(T data);
	void PostOrderTraversal()const;
	void PrintTreeOrder();
	T Count_LeafNodes()const;
	~BST();
};

