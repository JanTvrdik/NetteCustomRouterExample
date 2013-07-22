<?php
namespace App;

use Nette;


abstract class BaseManager extends Nette\Object
{
	/** @var  Nette\Database\SelectionFactory */
	protected $selectionFactory;

	public function __construct(Nette\Database\SelectionFactory $selectionFactory)
	{
		$this->selectionFactory = $selectionFactory;
	}
}
