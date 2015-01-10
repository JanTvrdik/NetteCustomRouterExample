<?php
namespace App;

use Nette;


abstract class BaseManager extends Nette\Object
{
	/** @var  Nette\Database\Context */
	protected $db;

	public function __construct(Nette\Database\Context $db)
	{
		$this->db = $db;
	}
}
