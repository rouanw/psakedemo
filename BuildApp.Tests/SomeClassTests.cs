using System;
using System.Collections.Generic;
using BuildApp.Models;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BuildApp.Tests
{
    [TestClass]
    public class SomeClassTests
    {
        [TestMethod]
        public void ItIsTrue()
        {
            var something = new SomeClass();
            something.SomeProperty.Should().BeTrue();
        }
        
        [TestMethod]
        public void ItHasAdam()
        {
            new List<String>
            {
                "bob",
                "john",
                "andy",
                "adam"
            }.Should().Contain("adam");
        }
    }
}
