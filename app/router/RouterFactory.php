<?php
namespace App;

use Nette;
use Nette\Application\Routers\Route;
use Nette\Application\Routers\RouteList;


/**
 * Router factory.
 */
class RouterFactory
{
	/** @var SlugManager */
	private $slugManager;

	public function __construct(SlugManager $slugManager)
	{
		$this->slugManager = $slugManager;
	}

	/**
	 * @return \Nette\Application\IRouter
	 */
	public function createRouter()
	{
		$router = new RouteList();
		$router[] = new CustomRouter($this->slugManager);
		$router[] = new Route('<presenter>/<action>', 'Homepage:default');

		return $router;
	}
}
